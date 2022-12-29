cd ~/pococms/website
poco-dir-update force
poco -timestamp
if [[ $? -ne 0 ]]; then
    echo "Quitting"
    exit 1
fi
o
