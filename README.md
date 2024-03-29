Links
-----
* https://www.alibabacloud.com/blog/developing-asp-net-core-apps-using-visual-studio-code-with-docker-on-simple-application-server_595353
* https://aws.amazon.com/blogs/compute/hosting-asp-net-core-applications-in-amazon-ecs-using-aws-fargate/
* https://github.com/aws-samples/amazon-ecs-fargate-aspnetcore/



Steps
----
  * use VS code
  * dotnet new –l //list available templates
  * dotnet new mvc -n mvconecs --no-https
  * CommandPalette.Docker: Add Docker files to workspace command (choose ASP.NET Core + port 5000)
  * docker logs [CONTAINER ID]  shows that not listening on port 5000
  * change docker file start to 
    ```
    FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS base
    WORKDIR /app
    ENV ASPNETCORE_URLS http://+:5000
    EXPOSE 5000
    ```
  * docker build --rm -f "Dockerfile" -t mvccoreecs:latest . 
  * docker run --rm -d -p 5000:5000/tcp mvccoreecs:latest
  * Add nginx ctainer
  * Add docker compose to test locally
  * change upstream server for nginx to 127.0.0.1:5000
  * docker build reverseproxy ctainer
  * tag images locally (link local <-> remote )
  * Push container images to ECR
  * create ECS cluster (Network only, EC2's created by fargate)
  * create Application Load Balancer - to load balance across multiple AWS Fargate tasks.
  * Create an ECS Fargate Task ( add the 2 containers) definition 
  * Create ECS Fargate Service, associate load balancer, container to load balance: reverse proxy
  * When success -> Load balancer will get 2 targets
  * Navigate to load balancer dns


Docker
------

| Command | Description |
| --- | --- |
| docker ps | List ct |
| docker stop [ctid] | stop |
| docker logs | check on what port listens |
| docker build --rm -f "Dockerfile" -t mvccoreecs:latest . | build |
| docker run --rm -d -p 5000:5000/tcp mvcecs:latest | run app |
| docker-compose build | |
| docker-compose up | |
| docker-compose stop | |
| docker-compose rm ||

