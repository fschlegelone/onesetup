# SHELL CONFIGURATION (ZSH)

## ENVIRONMENT VARIABLES

- `ZDOTDIR` zsh config directory (default: `$HOME`)

## CONFIG FILES

- files under `user_config` are the ones that are sourced in the home directory (or $ZDOTDIR if set).
- files under `system_config` are the ones in /etc/ that are sourced BEFORE the user config files.

**(!) -- IMPORTANT -- (!)**
**TREAT THE FILES IN `system_config` WITH CAUTION! WRONG CONFIGURATIONS THERE COULD BREAK THE SHELL!**
**(!) -- IMPORTANT -- (!)**

## SOURCE ORDER

### **login shells**

1. `/etc/zshenv`
2. `~/.zshenv`
3. `/etc/zprofile`
4. `~/.zprofile`
5. `/etc/zshrc`
6. `~/.zshrc`
7. `/etc/zlogin`
8. `~/.zlogin`
9. `~/.zlogout"` (**on logout**)
10. `/etc/zlogout` (**on logout**)

### **interactive shells**

1. `/etc/zshenv`
2. `~/.zshenv`
3. `/etc/zshrc`
4. `~/.zshrc`

### **non-interactive non-login shells**

1. `/etc/zshenv`
2. `~/.zshenv`
