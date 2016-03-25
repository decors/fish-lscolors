if command ls --version 1>/dev/null 2>/dev/null
    echo "lscolors plugin is not support GNU `ls`."
    exit 1
end

if not type "lscolors" ^/dev/null >&2
    source functions/lscolors.fish
end

lscolors --silent
