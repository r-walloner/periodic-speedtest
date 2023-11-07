# Periodic Speedtest Skript
A Python script that periodically measures your internet connection speed and saves the results to a CSV file.

## Getting Started
1. Install [Python 3](https://www.python.org/downloads/) and pip
2. Install the required packages with `pip install -r requirements.txt`
3. Run `python measure.py` to start measuring. You can use the `-h` flag to see available options.

## Usage
By default the script takes measurements indefinitely, waits 60 seconds between measurements, and saves the results to a file called `measurements.csv` in the current directory. The file will be created if it doesn't exist yet.

### Available Options
- `-h --help` Show help message and exit.
- `-f FILE --file FILE` (default: `measurements.csv`) Change the file the results are saved to. The file will be created if it doesn't exist yet.
- `-i INTERVAL --interval INTERVAL` (default: 60) Change the interval between measurements. The value of INTERVAL is interpreted in seconds.  
- `-n NUMBER --number NUMBER` (default: 0) Change the number of measurements to take. Zero means infinite measurements.