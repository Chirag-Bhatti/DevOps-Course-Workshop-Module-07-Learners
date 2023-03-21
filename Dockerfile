FROM mcr.microsoft.com/dotnet/sdk:6.0.407-bullseye-slim-amd64

USER root
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash - &&\
    apt-get install -y nodejs

COPY . /app
WORKDIR /app
RUN dotnet build

WORKDIR /app/DotnetTemplate.Web
RUN npm i
RUN npm run build

EXPOSE 5000
ENTRYPOINT ["dotnet", "run"]