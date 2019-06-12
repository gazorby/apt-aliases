# Kernel-package building shortcut
function kerndeb
    # temporarily unset MAKEFLAGS ( '-j3' will fail )
    set MAKEFLAGS ( print - $MAKEFLAGS | perl -pe 's/-j\s*[\d]+//g' )
    print ($MAKEFLAGS set to '"'$MAKEFLAGS'"')
    set appendage (-custom) # this shows up in $(uname -r)
    set revision (date +"%Y%m%d") # this shows up in the .deb file name

    make-kpkg clean

    time fakeroot make-kpkg --append-to-version "$appendage" --revision \
        "$revision" kernel_image kernel_headers
end