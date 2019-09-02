if [ -z "$1" ]
    then
        echo "No argument supplied"
        exit
    else
        SOURCE_DESTINATION=$1
        rsync -avh --progress --delete $SOURCE_DESTINATION
fi
# a - archive mode
# v - verbose
# h - human-readable
