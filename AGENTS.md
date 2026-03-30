Personal dotfiles extending [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles) for macOS/Linux.

## Commands
| Command | Description |
|---------|-------------|
| `./setup.sh` | Full installation |
| `shfmt -w *.sh` | Format shell scripts |
| `shellcheck *.sh` | Lint shell scripts |

## Conventions
- `*.local` naming required for thoughtbot compatibility
- snake_case for functions and local variables
- rcm manages dotfile symlinks
- vim-plug for Vim plugins
