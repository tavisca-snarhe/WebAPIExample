FROM mcr.microsoft.com/dotnet/core/sdk

COPY WebAPIExample/bin/Release/PublishOutput .

WORKDIR .

EXPOSE 8001

ENTRYPOINT ["dotnet", "WebAPIExample.dll"]