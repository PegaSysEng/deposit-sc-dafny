#! /bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

error=0
processeddirs=0

# The list of dirs 
listofdirs=`ls -d $1/*/`
for dir in $listofdirs "$1/"
do
    ./verifyAll.sh $dir
    if [ $? -eq 0 ] # check if errors
    then
      echo -e "${GREEN}No errors in directory $dir${NC}"
    else
      echo -e "${RED}Some errors occured in directory $dir${NC}"
      error=$((error + 1))
    fi
done

if [ $error -ne 0 ]
then
  echo -e "${RED}Some directories [$error/$processeddirs] has(ve) errors :-("
  exit 1
else 
  echo -e "${GREEN}No errors in any dirs! Great job.${NC}"
  exit 0
fi

