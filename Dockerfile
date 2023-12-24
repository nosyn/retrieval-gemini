# First stage: Get Golang image from DockerHub.
FROM golang:1.21.1 AS backend-builder

# Label app container.
LABEL appname="Retrieval Gemini"
LABEL author="Son Yen Nguyen. <nyenson1997@gmail.com>"
LABEL description="Google Gemini AI with Documents Retrieval"

# Set our working directory for backend building stage.
WORKDIR /app

# Copy all of our files.
COPY ./server .

# Get and install all dependencies.
RUN CGO_ENABLED=0 go build -o retrieval-gemini ./cmd/retrieval-gemini/main.go

# Next stage: Build our frontend application.
FROM node:lts AS web-builder

# Set our working directory for frontend building stage.
WORKDIR /app

# Copy web sources and package.json
COPY ./web .

# Build our application.
RUN npm install
RUN npm run build

# Last stage: discard everything except our executables.
FROM alpine:latest AS prod

# Set our next working directory.
WORKDIR /app

# Copy our executable and our built React application.
COPY --from=backend-builder /app/retrieval-gemini .
COPY --from=web-builder /app/dist ./web/dist

# Declare entrypoints and activation commands.
EXPOSE 8080
ENTRYPOINT ["./retrieval-gemini"]
