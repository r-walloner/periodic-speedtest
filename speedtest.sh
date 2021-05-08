# Print csv header to data file
speedtest --csv-header --csv-delimiter ";" > data.csv

while true; do
    echo -ne "Measuring...\033[0K"
    speedtest --csv --csv-delimiter ";" >> data.csv
    echo " Done!"
    tail -1 data.csv
    echo ""


    # Countdown until next measurement
    secs=$((1 * 60))
    while [ $secs -gt 0 ]; do
        echo -ne "Next measurement in $secs\033[0K\r"
        sleep 1
        : $((secs--))
    done
done