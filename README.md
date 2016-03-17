# lscolors

## Install

## Color Options

* colors
 * black, red, green, brown, blue, magenta, cyan
* options
 * --background=[color], --bold

### Example

```fish
set -g lscolors_directory blue                        # directory
set -g lscolors_symlink magenta                       # symbolic link
set -g lscolors_socket green                          # socket
set -g lscolors_pipe brown                            # pipe
set -g lscolors_executable red                        # executable
set -g lscolors_block blue --background=cyan          # block special
set -g lscolors_character blue --background=brown     # character special
set -g lscolors_exec_suid black --background=red      # executable with setuid bit set
set -g lscolors_exec_sgid black --background=cyan     # executable with setgid bit set
set -g lscolors_dir_sticky black --background=green   # directory writable to others, with sticky bit
set -g lscolors_dir_unsticky black --background=brown # directory writable to others, without sticky bit
```
