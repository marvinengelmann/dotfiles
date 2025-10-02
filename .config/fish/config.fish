if status is-interactive
    starship init fish | source
end

set -e fish_user_paths
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/libpq/bin
fish_add_path ~/.local/bin
fish_add_path ~/.bun/bin

set -x EDITOR hx

alias lg='lazygit'

function n
    set -l nnn_tmpfile ~/.config/nnn/.lastd
    nnn -Hdeo $argv
    if test -e $nnn_tmpfile
        source $nnn_tmpfile
        rm $nnn_tmpfile
    end
end
