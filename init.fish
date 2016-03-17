set -gx CLICOLOR 1
if not type "lscolors" ^/dev/null >&2
    source functions/lscolors.fish
end
set -gx LSCOLORS (lscolors)
