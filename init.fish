function __convert_color_to_designator

    set -l foreground_color ''
    set -l background_color ''
    set -l bold no

    for option in $argv
        switch "$option"
            case black red green brown blue magenta cyan gray
                set foreground_color $option
            case "--background=*"
                set -l IFS =
                echo $option | read -l opt value
                switch "$value"
                    case black red green brown blue magenta cyan gray
                        set background_color $value
                    case "*"
                        set background_color default
                end
            case "--bold"
                set bold yes
            case "*"
                set foreground_color default
        end
    end

    switch "$foreground_color"
        case black
            [ ! "$bold" = yes ]; and set foreground a; or set foreground A
        case red
            [ ! "$bold" = yes ]; and set foreground b; or set foreground B
        case green
            [ ! "$bold" = yes ]; and set foreground c; or set foreground C
        case brown
            [ ! "$bold" = yes ]; and set foreground d; or set foreground D
        case blue
            [ ! "$bold" = yes ]; and set foreground e; or set foreground E
        case magenta
            [ ! "$bold" = yes ]; and set foreground f; or set foreground F
        case cyan
            [ ! "$bold" = yes ]; and set foreground g; or set foreground G
        case gray
            [ ! "$bold" = yes ]; and set foreground h; or set foreground H
        case "*"
            set foreground x
    end

    switch "$background_color"
        case black
            set background a
        case red
            set background b
        case green
            set background c
        case brown
            set background d
        case blue
            set background e
        case magenta
            set background f
        case cyan
            set background g
        case gray
            set background h
        case "*"
            set background x
    end

    printf "%s%s" $foreground $background
end

function __lscolors -d 'Generate LSCOLORS for BSD'
    set -q lscolors_directory; and set directory $lscolors_directory; or set directory blue
    set -q lscolors_symlink; and set symlink $lscolors_symlink; or set symlink magenta
    set -q lscolors_socket; and set socket $lscolors_socket; or set socket green
    set -q lscolors_pipe; and set pipe $lscolors_pipe; or set pipe brown
    set -q lscolors_executable; and set executable $lscolors_executable; or set executable red
    set -q lscolors_block; and set block $lscolors_block; or set block blue --background=cyan
    set -q lscolors_character; and set character $lscolors_character; or set character blue --background=brown
    set -q lscolors_exec_suid; and set exec_suid $lscolors_exec_suid; or set exec_suid black --background=red
    set -q lscolors_exec_sgid; and set exec_sgid $lscolors_exec_sgid; or set exec_sgid black --background=cyan
    set -q lscolors_dir_sticky; and set dir_sticky $lscolors_dir_sticky; or set dir_sticky black --background=green
    set -q lscolors_dir_unsticky; and set dir_unsticky $lscolors_dir_unsticky; or set dir_unsticky black --background=brown

    __convert_color_to_designator $directory
    __convert_color_to_designator $symlink
    __convert_color_to_designator $socket
    __convert_color_to_designator $pipe
    __convert_color_to_designator $executable
    __convert_color_to_designator $block
    __convert_color_to_designator $character
    __convert_color_to_designator $exec_suid
    __convert_color_to_designator $exec_sgid
    __convert_color_to_designator $dir_sticky
    __convert_color_to_designator $dir_unsticky
end

set -x CLICOLOR 1
set -x LSCOLORS (__lscolors)