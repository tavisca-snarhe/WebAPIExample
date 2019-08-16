FROM mcr.microsoft.com/dotnet/core/aspnet:2.2

WORKDIR app

COPY WebAPIExample/Publish .

EXPOSE 8004

ENTRYPOINT ["dotnet", "WebAPIExample.dll"]