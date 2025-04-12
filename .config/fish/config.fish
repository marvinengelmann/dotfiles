if status is-interactive
    starship init fish | source
end

set -e fish_user_paths
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/libpq/bin
fish_add_path /Users/marvinengelmann/.local/bin
fish_add_path /Users/marvinengelmann/.bun/bin
