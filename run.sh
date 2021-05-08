# Print csv header to data file
echo -n "Initial measurement..."
bin/speedtest --format=tsv --output-header > data.csv
bin/speedtest --format=tsv >> data.csv
bin/speedtest --format=tsv >> data.csv
echo " Done!"

while true; do
    echo -ne "Measuring...\033[0K"
    bin/speedtest --format=tsv >> data.csv
    bin/speedtest --format=tsv >> data.csv
    bin/speedtest --format=tsv >> data.csv
    echo " Done!"
    tail -3 data.csv
    echo ""


    # Countdown until next measurement
    secs=$((60 * 60))
    while [ $secs -gt 0 ]; do
        echo -ne "Next measurement in $secs\033[0K\r"
        sleep 1
        : $((secs--))
    done
done