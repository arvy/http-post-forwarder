docker build -t sinatra-http-request-forwarder .
docker run -t -p 4567:4567 sinatra-http-request-forwarder
