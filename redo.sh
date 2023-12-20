#!/bin/bash

help() {
  echo "Description:"
  echo "    long-time memory game and training warrior"
  echo "    helps to remember historical people and science definitions"
  echo "Usage:"
  echo "    redo --verion <=> print version and exit"
  echo "    redo --help <=> display help and exit"
  echo "    redo '<term>' <=> remember particular termin"
  echo "    redo <=> ask random termins until you meet unkown"
  echo "Author:"
  echo "    Vsevolod Nitsenko (vsnits)"
  echo "    <hellovsnits@tutanota.com>"
  echo "Licence:"
  echo "    General Public Licence"
  exit 0
 }

version() {
  echo "<redo> version 0.2"
  exit 0
 }

# main
for opt in "$@"
do
    if [[ $opt == "--version" ]]
    then 
        version
    elif [[ $opt == "--help" ]]
    then 
        help
    elif [[ ${opt:0:1} = "-" ]] # respect mistypes
    then 
        echo "unrecognised option. Try redo --help"
        exit 2
    fi
done
## continue if none of super options given

pth=$(realpath $0) # remember actual path to game
# later used for processor and file path

if [[ $1 ]]
then 
    # add term to list
    echo $1 >> "${pth}.words"
    echo "got it!"
else
    # execute python game via realpath
    python3 "${pth}.py" "${pth}.words"
fi

