# HUProxy
A [Docker image](https://www.docker.com/) for [HUProxy](https://github.com/google/huproxy).

## Usage
```
docker run -d -p 8086:8086 tblyler/huproxy
```

You can then use port `8086` for your web proxy. For configuration see [HUProxy's GitHub](https://github.com/google/huproxy).

To run with different options...

> -listen :8086 is part of the ENTRYPOINT

```
docker run -d -p 8086:8086 tblyler/huproxy -dial_timeout 30s -write_timeout 30s -handshake_timeout 30s
```
