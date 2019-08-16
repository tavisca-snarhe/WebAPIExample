FROM mcr.microsoft.com/dotnet/core/sdk

COPY WebAPIExample/bin/Release/PublishOutput .

WORKDIR .

EXPOSE 12345

ENTRYPOINT ["dotnet", "WebAPIExample.dll"]