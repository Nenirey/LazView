#!/bin/sh 

set -e

# if you compile first time you must change variable "lazpath" and "lcl"
# after it execute this script with parameter "all" at lazview dir
# "./build.sh all" it build lazview
#                                                 by Segator


# You can execute this script with different parameters:
# default - compiling LazView only (using by default)

# path to lazbuild
export lazbuild=$(which lazbuild)

# Set up widgetset: gtk or gtk2 or qt
# Set up processor architecture: i386 or x86_64
if [ $2 ]
  then export lcl=$2
fi
if [ $lcl ] && [ $CPU_TARGET ]
  then export lazview_ARCH=$(echo "--widgetset=$lcl")" "$(echo "--cpu=$CPU_TARGET")
elif [ $lcl ]
  then export lazview_ARCH=$(echo "--widgetset=$lcl")
elif [ $CPU_TARGET ]
  then export lazview_ARCH=$(echo "--cpu=$CPU_TARGET")
fi

build_default()
{
  $lazbuild src/lazview.lpi $lazview_ARCH
  
  strip lazview
}

build_beta()
{

  # Build versionitis
  #$lazbuild src/versionitis.lpi

  # Update version
  #src/versionitis -verbose

  # Build lazview
  $lazbuild src/lazview.lpi --bm=beta $lazview_ARCH
  
  # Build Dwarf LineInfo Extractor
  #$lazbuild tools/extractdwrflnfo.lpi
  
  # Extract debug line info
  #chmod a+x tools/extractdwrflnfo
  #if [ -f lazview.dSYM/Contents/Resources/DWARF/lazview ]; then
   # mv -f lazview.dSYM/Contents/Resources/DWARF/lazview $(pwd)/lazview.dbg
  #fi
  #tools/extractdwrflnfo lazview.dbg
  
  # Strip debug info
  strip lazview
}
build_release()
{

  # Build versionitis
  #$lazbuild src/versionitis.lpi

  # Update version
  #src/versionitis -verbose

  # Build lazview
  $lazbuild src/lazview.lpi --bm=release $lazview_ARCH

  # Build Dwarf LineInfo Extractor
  #$lazbuild tools/extractdwrflnfo.lpi

  # Extract debug line info
  #chmod a+x tools/extractdwrflnfo
  #if [ -f lazview.dSYM/Contents/Resources/DWARF/lazview ]; then
    #mv -f lazview.dSYM/Contents/Resources/DWARF/lazview $(pwd)/lazview.dbg
  #fi
  #tools/extractdwrflnfo lazview.dbg

  # Strip debug info
  strip lazview
}

build_all()
{
  build_default
}


case $1 in
        beta)  build_beta;;
        release) build_release;;
         all)  build_all;;
           *)  build_default;;
esac
