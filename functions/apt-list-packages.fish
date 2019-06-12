# List packages by size
function apt-list-packages
    dpkg-query -W --showformat='${Installed-Size} ${Package} ${Status}\n' | \
        grep -v deinstall | \
        sort -n | \
        awk '{print $1" "$2}'
end