FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS base
WORKDIR /app
ENV ASPNETCORE_URLS http://+:5000
EXPOSE 5000

FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY ["mvconecs/mvconecs.csproj", "mvconecs/"]
RUN dotnet restore "mvconecs/mvconecs.csproj"
COPY . .
WORKDIR "/src/mvconecs"
RUN dotnet build "mvconecs.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "mvconecs.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "mvconecs.dll"]
