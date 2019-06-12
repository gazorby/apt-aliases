# apt-add-repository with automatic install/upgrade of the desired package
# Usage: aar ppa:xxxxxx/xxxxxx [packagename]
# If packagename is not given as 2nd argument the function will ask for it and guess the default by taking
# the part after the / from the ppa name which is sometimes the right name for the package you want to install
function aar
    if set -q "$2"
        set PACKAGE $argv[2]
    else
        read -l -P "Type in the package name to install/upgrade with this ppa $argv[1] : " PACKAGE
    end

    if test -z "$PACKAGE"
        set PACKAGE (echo $argv[1] | awk -F '/' '{print $1}')
    end

    sudo apt-add-repository $1 && sudo $APT update
    sudo $APT install $PACKAGE
end