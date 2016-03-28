if not command ls --version ^/dev/null >&2
    if not type -q "lscolors"
        source functions/lscolors.fish
    end
    lscolors --silent
else
    echo "lscolors plugin is not support GNU `ls`."
end
