FILENAME=${1%.*}
CURRENT_DIRECTORY=$(pwd)
pandoc $FILENAME.md --from markdown -H ~/bin/disable_float.tex -t pdf -V geometry:"top=1in, bottom=1in, left=1in, right=1in" > $CURRENT_DIRECTORY/pdf/$FILENAME.pdf && zathura $CURRENT_DIRECTORY/pdf/$FILENAME.pdf
