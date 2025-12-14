FROM gradle:8.5-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle installDist --no-daemon

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/build/install/cloudstream-backend ./app
EXPOSE 8080
CMD ["./app/bin/cloudstream-backend"]
