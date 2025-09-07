# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Quickstart and Essential Commands

### Starting Emacs
```bash
# Debug startup issues
emacs --debug-init

# Start with minimal config for testing
emacs -Q -l ./init.el

# Ensure Homebrew environment (zsh)
eval "$(/opt/homebrew/bin/brew shellenv)"  # Apple Silicon
# eval "$(/usr/local/bin/brew shellenv)"    # Intel Mac

# Launch Homebrew Emacs with debugging
/opt/homebrew/bin/emacs --debug-init      # Apple Silicon
# /usr/local/bin/emacs --debug-init       # Intel Mac

# Using emacsclient
emacsclient -c -a ""
```

### Testing Startup
```bash
# Test startup (using existing test script)
./test-startup.sh

# Or manually test batch startup
emacs -nw --batch --eval '(progn (load-file "init.el") (message "Startup successful"))'
```

### Package Management
```bash
# Refresh package contents (when needed)
emacs --batch -l ./init.el --eval "(progn (require 'package) (package-refresh-contents))"

# List and update packages interactively
# M-x package-list-packages, then 'U' followed by 'x'
```

### Cleaning and Maintenance
```bash
# Remove compiled files
find . -name "*.elc" -delete

# Clean package cache (adjust paths as needed)
rm -rf elpa/
rm -rf ~/.emacs.d/eln-cache

# Check for load-path shadows and conflicts
emacs --batch -l ./init.el --eval "(progn (list-load-path-shadows) (message \"Done\"))"
```

## Architecture Overview

This Emacs configuration uses a modular, platform-aware architecture:

### Directory Structure
```
.
├── init.el                    # Main entry point
├── early-init.el              # Emacs 27+ early initialization
├── common/                    # Shared configuration across platforms
│   ├── boot-packages.el       # Package system initialization
│   ├── config.el              # Common settings and preferences
│   ├── packages.el            # Package declarations with use-package
│   └── keys.el                # Key bindings and shortcuts
├── lisp/                      # Modular configuration files
│   ├── init-*.el              # Feature-specific modules (60+ files)
│   └── .dir-locals.el         # Local variables for lisp development
├── brew/                      # Homebrew Emacs-specific configuration (primary)
├── aqua/                      # Aquamacs-specific overrides (legacy)
├── linux/                     # Linux-specific configuration (legacy)
└── test-startup.sh            # Startup testing script
```

### Platform Detection
The configuration detects platform context through these helper functions (defined in `common/init.el`):
- `(is-brew)` - Returns true for Homebrew Emacs on macOS (primary context)
- `(is-mac)` - Returns true for macOS variants
- `(is-aqua)` - Returns true for Aquamacs (legacy support)
- `(is-linux)` - Returns true for GNU/Linux systems (legacy support)

## Boot Sequence and Initialization Flow

1. **early-init.el** - Disables automatic package initialization
2. **init.el** - Sets up directories and loads common initialization
3. **common/boot-packages.el** - Configures package archives and installs use-package
4. **common/packages.el** - Declares packages using use-package
5. **common/config.el** - Applies common settings and preferences
6. **common/keys.el** - Sets up key bindings

Platform-specific customizations are applied through separate init files in `aqua/`, `brew/`, and `linux/` directories. For Homebrew Emacs, the `brew/` directory contains the primary platform customizations.

## Platform Contexts and Customizations

### Homebrew Emacs on macOS (Primary Context)
- **Binary Location**: `/opt/homebrew/bin/emacs` (Apple Silicon) or `/usr/local/bin/emacs` (Intel)
- **GUI Features**: Font settings, titlebar customization, modifier key mappings
- **PATH Integration**: Uses `exec-path-from-shell` to inherit zsh shell environment
- **Environment Setup**: Requires `eval "$(/opt/homebrew/bin/brew shellenv)"` in zsh
- **Custom File**: Platform-specific settings stored in `brew/custom.el`
- **Package Management**: Full MELPA, GNU ELPA, NonGNU ELPA support

### Legacy Support
- **Aquamacs**: Special handling for Aquamacs-specific features (legacy)
- **Linux**: Generic GNU/Linux support with system package dependencies (legacy)

## Package Management Strategy

### Use-Package Based Configuration
- **Primary Tool**: use-package for declarative package configuration
- **Package Sources**: MELPA, GNU ELPA, NonGNU ELPA
- **Auto-Install**: `use-package-always-ensure` set to `t`
- **Lazy Loading**: Extensive use of `:defer`, `:commands`, `:mode`, and `:hook`

### Common Patterns
```emacs-lisp
(use-package package-name
  :ensure t                    # Install if not present
  :defer t                     # Lazy load
  :mode "\\.ext$"             # Auto-load for file extensions
  :hook (mode . function)     # Hook into major modes
  :bind ("C-c k" . function)  # Key bindings
  :config                     # Post-load configuration
  (setq package-var value))
```

## Key Language and Tool Support

The configuration provides enhanced support for:
- **Languages**: Ruby/Rails, JavaScript/TypeScript, Python, Clojure, Haskell, Elm, Common Lisp, PHP, CSS/SASS
- **Markup**: Markdown, HTML, YAML, JSON
- **Development Tools**: Git (Magit), Company (completion), Flycheck (syntax checking)
- **Data Formats**: CSV, SPARQL, SQL

## Key Bindings and Conventions

### Global Bindings
- `C-tab` - Cycle to next buffer
- `M-o` - Switch to other window  
- `M-g` - Go to line
- `C-c o` - Occur (search in buffer)
- `C-x g` - Magit status
- `M-/` - Company completion
- `C-=` - Expand region

### Platform-Specific
- **macOS**: Command key handling optimized for Homebrew Emacs
- **Function Keys**: Meta-F12 for Magit status

### File Creation with ido-mode
- **Creating new files**: Use `C-x C-f` then `C-j` to force creation of exact filename
- **Alternative**: Use `C-f` during file selection to drop into regular find-file mode

## Development and Customization

### Adding New Configuration
1. Create `lisp/init-feature.el` with your configuration
2. Add `(provide 'init-feature)` at the end
3. Require it from the appropriate initialization file
4. Use `use-package` patterns consistent with existing modules

### Local Customization
- Create `lisp/init-local.el` for personal customizations
- Add `(provide 'init-local)` at the end
- It will be automatically loaded if present

### Custom File Location
Platform-specific custom files are used:
- Homebrew Emacs: `custom-file` set to `brew/custom.el`
- Legacy platforms: Aqua uses default custom file handling, others use `<platform>/custom.el`

## Module Organization (lisp/ directory)

The `lisp/` directory contains 60+ modular configuration files:
- **Core**: `init-elpa.el`, `init-compat.el`, `init-utils.el`
- **UI**: `init-gui-frames.el`, `init-themes.el`, `init-fonts.el`
- **Editing**: `init-editing-utils.el`, `init-paredit.el`, `init-company.el`
- **Languages**: `init-ruby-mode.el`, `init-javascript.el`, `init-python-mode.el`, etc.
- **Tools**: `init-git.el`, `init-projectile.el`, `init-flycheck.el`
- **System**: `init-osx-keys.el`, `init-exec-path.el`

## Troubleshooting and Maintenance

### Common Issues
1. **Startup Errors**: Use `--debug-init` to see detailed error messages
2. **Package Problems**: Refresh package contents with `M-x package-refresh-contents`
3. **Performance Issues**: Check startup time with built-in profiler
4. **Platform Issues**: Verify platform detection functions return expected values

### Profiling Startup
```emacs-lisp
;; Built-in profiler
(profiler-start 'cpu)
;; ... start Emacs normally, then:
(profiler-report)
```

### Debugging Platform Detection
```emacs-lisp
;; Evaluate these in scratch buffer or with M-:
(message "Context: %s" *emacs-context*)
(message "Is Mac: %s" (is-mac))
(message "Is Aqua: %s" (is-aqua))
(message "Is Brew: %s" (is-brew))
(message "Is Linux: %s" (is-linux))
```

This configuration has been continuously developed since 2000 and is battle-tested across multiple Emacs versions and platforms. The modular architecture allows for easy customization while maintaining compatibility across different environments.

<citations>
<document>
    <document_type>RULE</document_type>
    <document_id>0JdM9JjgKzhO8zCE9oA1HG</document_id>
</document>
</citations>
