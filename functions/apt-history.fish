# Prints apt history
# Usage:
#   apt-history install
#   apt-history upgrade
#   apt-history remove
#   apt-history rollback
#   apt-history list
# Based On: https://linuxcommando.blogspot.com/2008/08/how-to-show-apt-log-history.html
function apt-history
    switch $argv[1]
        case install
            set pkgs (ls -rt /var/log/dpkg*)
            zgrep --no-filename 'install ' $pkgs
        case 'upgrade|remove'
            set pkgs (ls -rt /var/log/dpkg*)
            zgrep --no-filename $1 $pkgs
        case rollback
            set pkgs (ls -rt /var/log/dpkg*)
            zgrep --no-filename upgrade $pkgs | \
                grep "$2" -A10000000 | \
                grep "$3" -B10000000 | \
                awk '{print $4"="$5}'
        case list
            set pkgs (ls -rt /var/log/dpkg*)
            zgrep --no-filename '' $pkgs
        case '*'
            echo "Parameters:"
            echo " install - Lists all packages that have been installed."
            echo " upgrade - Lists all packages that have been upgraded."
            echo " remove - Lists all packages that have been removed."
            echo " rollback - Lists rollback information."
            echo " list - Lists all contains of dpkg logs."
    end
end