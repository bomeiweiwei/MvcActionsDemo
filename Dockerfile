FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY MvcActionsDemo.Web/MvcActionsDemo.Web.csproj MvcActionsDemo.Web/
RUN dotnet restore MvcActionsDemo.Web/MvcActionsDemo.Web.csproj

COPY . .

RUN dotnet publish MvcActionsDemo.Web/MvcActionsDemo.Web.csproj \
    -c Release \
    -o /app/publish \
    --no-restore


FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app

COPY --from=build /app/publish .

EXPOSE 8080

ENTRYPOINT ["dotnet", "MvcActionsDemo.Web.dll"]