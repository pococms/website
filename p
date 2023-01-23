cd ~/pococms/website
poco-dir-update force
#poco -timestamp
poco 
if [[ $? -ne 0 ]]; then
    echo "Quitting"
    exit 1
fi
o
