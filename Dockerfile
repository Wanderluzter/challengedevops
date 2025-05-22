# Etapa 1: build
FROM mcr.microsoft.com/dotnet/sdk:9.0-preview AS build
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:9.0-preview AS runtime
WORKDIR /app

# Instalar dnsutils e outras ferramentas de rede
RUN apt-get update && apt-get install -y dnsutils iputils-ping curl netcat && rm -rf /var/lib/apt/lists/*

COPY --from=build /app/out ./

ENV ASPNETCORE_URLS=http://+:5087

EXPOSE 5087
ENTRYPOINT ["dotnet", "challengedotnet.dll"]

