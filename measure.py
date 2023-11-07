import speedtest
import argparse
import time

def initialize(file):
    """
    Initializes the output file with the CSV header if it does not exist.
    If the file already exists, it is reused.

    Args:
        file (str): The path to the output file.

    Returns:
        None
    """
    try:
        with open(file, 'x') as f:
            f.write(speedtest.Speedtest().results.csv_header() + '\n')
            print("Initialized output file " + file)
    except FileExistsError:
        print("Output file " + file + " already exists, reusing it.")
        pass

def measure(file):
    """
    Measures the download and upload speed using the Speedtest library and writes the results to a CSV file.
    
    Args:
    file (str): The path to the CSV file where the results will be written.
    
    Returns:
    None
    """
    test = speedtest.Speedtest()
    
    print("Measuring download speed...")
    download_speed = test.download()
    print("Download speed: " + str(download_speed) + " bytes per second")
    
    print("Measuring upload speed...")
    upload_speed = test.upload()
    print("Upload speed: " + str(upload_speed) + " bytes per second")
    
    #print result to csv
    with open(file, 'a') as f:
        f.write(test.results.csv() + '\n')
    
if __name__ == "__main__":
    # define and parse command line arguments
    arg_parser = argparse.ArgumentParser(description='Periodically measure internet connection speed')
    arg_parser.add_argument('-f', '--file', type=str, default='measurements.csv', help='file to write the results to')
    arg_parser.add_argument('-i', '--interval', type=int, default=60, help='interval between measurements in seconds')
    arg_parser.add_argument('-n', '--number', type=int, default=0, help='number of measurements to take (0 for no limit)')
    args = arg_parser.parse_args()
    
    # initialize output file
    initialize(args.file)
    
    # take measurements until the user stops the program or the measurement limit is reached
    measurements = 0
    while True:
        try:
            measure(args.file)
            measurements += 1
            
            if measurements >= args.number and args.number > 0:
                break
            
            print("Waiting " + str(args.interval) + " seconds until next measurement...")
            time.sleep(args.interval)
            
        except KeyboardInterrupt:
            print("Measurement stopped by user.")
            break
        
    print("Done. Took " + str(measurements) + " measurements.")
        