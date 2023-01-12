# Run Cypress with Docker

Eventhough, this is not recommended for running locally (simple ``npx cypress start` will do that for you.), it is needed for running in CI tools (not GitHub Actions).
Read [Run Cypress with a single Docker command](https://www.cypress.io/blog/2019/05/02/run-cypress-with-a-single-docker-command/)

## Run tests

From the root of your repo:

```shell
$ docker run -it -v $PWD/testing:/testing -w /testing  --entrypoint=cypress cypress/included run --browser=chrome
# runs Cypress tests from the current folder
```

**Note:** Currently, the linux/arm64 build of this image does not contain any browsers except Electron. See https://github.com/cypress-io/cypress-docker-images/issues/695 for more information.
