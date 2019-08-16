FROM mcr.microsoft.com/dotnet/core/aspnet:2.2

WORKDIR app

COPY WebAPIExample/bin/Release/PublishOutput .

EXPOSE 8001

ENTRYPOINT ["dotnet", "WebAPIExample.dll"]