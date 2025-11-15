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
set -x NNN_TMPFILE ~/.config/nnn/.lastd

alias lg='lazygit'
alias cc='claude'

function nn
    nnn -deHo $argv
    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end
