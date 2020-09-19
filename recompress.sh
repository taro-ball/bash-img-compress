export SOURCE="/x/photo/2020"
export DESTINATION="/d/photo_out"
# find $SOURCE -maxdepth 1 -mindepth 1 -type d -printf '%f\n'
for di in $SOURCE/*/     # list directories in the form "/tmp/dirname/"
do
    dir=${di%*/}      # remove the trailing "/"
    echo $dir
#    echo ${dir##*/}    # print everything after the final "/"
#    LIST=$(find \"$dir\" -name *.jpg)
    find \"$dir\" -name "*.jpg" -type f -print0 |
    while read -d '' file
    do
        echo "<<$file>>"
    done
    #echo $LIST
done

