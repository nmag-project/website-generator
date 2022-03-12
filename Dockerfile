from alpine:3.11

# Install dependencies
run apk --no-cache add make bash python py2-pip rsync
run pip install docutils

# Extract and link r2w
run mkdir -p /opt/rest2web
add rest2web-0.5.1.tar.gz /opt/rest2web/
workdir /opt/rest2web/
### Seems docker already unpacks the tar file ... odd
# run tar xzvf rest2web-0.5.1.tar.gz
run chmod 755 rest2web-0.5.1/r2w.py
run ln -s /opt/rest2web/rest2web-0.5.1/r2w.py /bin/r2w

# work directory
workdir /nmag-www

cmd bash
run echo "Compile the docs in the container with 'make r2w'"
