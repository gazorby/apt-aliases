# hello_world initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies

if type -q apt
    set APT apt
else
    set APT apt-get
end

abbr -a -U acs 'apt-cache search'

abbr -a -U afs 'apt-file search --regexp'

# These are apt/apt-get only
abbr -a -U ags "$APT source"

abbr -a -U acp 'apt-cache policy'

#List all installed packages
abbr -a -U agli 'apt list --installed'

# superuser operations ######################################################

# List available updates only
abbr -a -U aglu 'sudo apt-get -u upgrade --assume-no'

abbr -a -U afu 'sudo apt-file update'

abbr -a -U ppap 'sudo ppa-purge'

abbr -a -U age "sudo $APT"
abbr -a -U aga "sudo $APT autoclean"
abbr -a -U agb "sudo $APT build-dep"
abbr -a -U agc "sudo $APT clean"
abbr -a -U agd "sudo $APT dselect-upgrade"
abbr -a -U agi "sudo $APT install"
abbr -a -U agp "sudo $APT purge"
abbr -a -U agr "sudo $APT remove"
abbr -a -U agu "sudo $APT update"
abbr -a -U agud "sudo $APT update && sudo $APT dist-upgrade"
abbr -a -U agug "sudo $APT upgrade"
abbr -a -U aguu "sudo $APT update && sudo $APT upgrade"
abbr -a -U agar "sudo $APT autoremove"


# Remove ALL kernel images and headers EXCEPT the one in use
# abbr -a -U kclean 'sudo aptitude remove -P ?and(~i~nlinux-(ima|hea) ?not(~n`uname -r`))'

# Misc. #####################################################################
# print all installed packages
abbr -a -U allpkgs 'dpkg --get-selections | grep -v deinstall'

# Create a basic .deb package
abbr -a -U mydeb 'time dpkg-buildpackage -rfakeroot -us -uc'
