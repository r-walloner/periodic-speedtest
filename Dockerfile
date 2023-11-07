FROM python:3-alpine
WORKDIR /usr/src/periodic-speedtest
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT [ "python", "measure.py", "-f", "/var/log/periodic-speedtest/measurements.csv" ]