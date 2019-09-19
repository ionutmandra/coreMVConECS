Docker
------

| Command | Description |
| --- | --- |
| docker ps | List ct |
| docker stop [ctid] | stop |
| docker logs | check on what port listens |
| docker build --rm -f "Dockerfile" -t mvccoreecs:latest . | build |
| docker run --rm -d -p 5000:5000/tcp mvcecs:latest | run app |
