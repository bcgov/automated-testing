set e+x

LOCAL_NAME=cypress/included:latest
echo "Building $LOCAL_NAME"
docker build -t $LOCAL_NAME .
