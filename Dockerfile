FROM scratch

COPY gopath/bin/main /main

ENTRYPOINT ["/main"]