export SOURCE="/x/photo/2020"
export DESTINATION="/d/photo_out"
# find $SOURCE -maxdepth 1 -mindepth 1 -type d -printf '%f\n'
for di in $SOURCE/*/     # list directories in the form "/tmp/dirname/"
do
    dir=${di%*/}      # remove the trailing "/"
    cd "$dir"
    echo =================================
    pwd
    find . -type f -iname '*.j*' -print0 | 
    while IFS= read -r -d '' file; do
        printf '%s\n' "$file"
    done

done
