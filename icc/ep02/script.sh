make

for file in sample/*.in; do
    echo $file
    ./ep02 < "$file"
    echo
done