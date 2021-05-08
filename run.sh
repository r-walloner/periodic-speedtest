while true; do
    echo -ne "Measuring...\033[0K"
    echo "\"$(date +\%d.\%m.\%Y\ \%H:\%M:\%S)\",$(bin/speedtest --format=csv)" >> data.csv
    echo "\"$(date +\%d.\%m.\%Y\ \%H:\%M:\%S)\",$(bin/speedtest --format=csv)" >> data.csv
    echo "\"$(date +\%d.\%m.\%Y\ \%H:\%M:\%S)\",$(bin/speedtest --format=csv)" >> data.csv
    echo " Done!"
    tail -3 data.csv
    echo ""


    # Countdown until next measurement
    secs=$((30 * 60))
    while [ $secs -gt 0 ]; do
        echo -ne "Next measurement in $secs\033[0K\r"
        sleep 1
        : $((secs--))
    done
done