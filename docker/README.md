```bash
$ curl -vk https://localhost:443
* Host localhost:443 was resolved.
* IPv6: ::1
* IPv4: 127.0.0.1
*   Trying [::1]:443...
* schannel: disabled automatic use of client certificate
* Connected to localhost (::1) port 443
* using HTTP/1.x
> GET / HTTP/1.1
> Host: localhost
> User-Agent: curl/8.11.0
> Accept: */*
```

```bash
$ curl -i -X GET https://localhost:443/
HTTP/1.1 200 OK
Server: nginx/1.28.0
Date: Thu, 15 May 2025 07:35:33 GMT
Content-Type: text/html
Content-Length: 29
Last-Modified: Wed, 14 May 2025 19:13:43 GMT
Connection: keep-alive
ETag: "6824eb67-1d"
Accept-Ranges: bytes

<h1>Hello ATON employee!</h1>
```