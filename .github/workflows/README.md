## Workflows
In this library you'll find examples of GitHub Actions workflows that you can use to run your Cypress tests in GHA.
The examples are based on using the following GitHub Action: https://github.com/cypress-io/github-action
You'll find detailed documentation about the action there as well.

To effectively run your tests in GHA, you have to make sure that you have set up your test suite using environment variables, some of which can be hardcoded into the workflow and others can be pulled from Github secrets.

The following workflows examples are available:
* Cypress Simple Manual: The most basic set up, that can be started manually
* Cypress Complex Auto: The more complex set up, that will be started automatically when code is pushed or manually when needed

_NB: These workflows have a special Cypress install directive ```npm ci -h``` for Cypress to avoid version clashes between Cypress and used components. This will show up as WARN in your console output._

### Complex Workflow
This [workflow](https://github.com/bcgov/automated-testing/blob/main/.github/workflows/cypress-complex-auto.yaml) starts automatically on push or can be triggered manually. This is a desirable pattern as it allows for adhoc test runs without a code push. This can be useful when non-code changes need to be verified.
```yaml
on: [push, workflow_dispatch]
```

**Environment Variables**
In order for Cypress to run well, it needs to be fed the needed parameters. The below is a mix of Cypress environment variables (All capital) and ones that are needed for this specific set of scripts (Mix of capital and lowercase)
```yaml
CYPRESS_RECORD_KEY: ${{ secrets.RECORDING_KEY }}
CYPRESS_username: ${{ secrets.CYPRESS_USER_NAME }}
CYPRESS_password: ${{ secrets.CYPRESS_PASSWORD }}
CYPRESS_BASE_URL: ${{ secrets.CYPRESS_BASEURL }}
CYPRESS_host: ${{ secrets.CYPRESS_HOST }}
CYPRESS_ENVIRONMENT: ${{ github.base_ref }}
CYPRESS_authRealm: ${{ secrets.CYPRESS_AUTH_REALM }}
CYPRESS_authClientId: ${{ secrets.CYPRESS_AUTH_CLIENT_ID }}
CYPRESS_authUrl: ${{ secrets.CYPRESS_AUTH_URL }}
GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
**Waiting for API/APP Readiness**
    
In case of running a comprehensive pipeline which builds/Deploys and tests your solution, we find that many solutions have an API and APP that start fairly slow (specifically when not many platform resources are available). Since the APP needs the API and Cypress needs the APP, we first have to test if the API is running and accessible. Often an OK from the OpenShift deploy does not automatically mean that the API/APP is functional and/or reachable. We like to use a straightforward CURL command, which we have included as a script in this repo. (There are other options available, but they tend to be quite slow)
```yaml
      - name: Wait for API response
        env:
          url: ${{ secrets.CYPRESS_API_HOST }}
          code: 200 # The HTML Code we expect to get back
          wait_time: 10 # Wait time in seconds between each attempt total wait time = wait_time * max_attempts
          max_attempts: 5
        run: |
          cd tool-guidance/testing
          chmod +x waitforconnection.sh
          bash ./waitforconnection.sh          

      - name: Wait for APP response
        env:
          url: ${{ secrets.CYPRESS_HOST }}
          code: 200
          wait_time: 10
          max_attempts: 5
        run: |
          cd tool-guidance/testing
          chmod +x waitforconnection.sh
          bash ./waitforconnection.sh 
```            
The CURL command ignores errors and keeps trying until the indicated status has been achieved or the amount of tries have been exceeded.
```sh

#!/bin/bash
# max_attempts=3
# wait_time=15
# url=https://api-biohubbc.apps.silver.devops.gov.bc.ca/version
# code=200
if [ $(curl --output /dev/null --silent --head -X GET --retry ${max_attempts} --fail --retry-all-errors --retry-delay ${wait_time} --retry-max-time 240 -w "%{response_code}\n" ${url}) -eq ${code} ]; then
	echo "Connection Success!"
else
	echo "Failed Connection!"
        exit 1
fi
```
**CYPRESS Execution**
The execution of the script is performed by GitHub Action: https://github.com/cypress-io/github-action. Here you'll find the details on all the options like runing parallel execution etc.

The Cypress action is invoked with a set of extra parameters:  

* **wait-on/wait-on-timeout**: This is the Cypress way of waiting for a response from the application under test, but it does not address the API readiness hence the earlier waiting code.
* **record**: Switches on recording to the cloud-based Cypress dahsboard
* **install-command**: Since we are forcing our libraries (keycloak) to be installed because of version issues, we have to specify "npm ci -f" to install as the normal "npm ci" would results in errors. If you do not run additional libraries or forced the libraries to install, then this option can be left out.
* **working-directory**: points to where you test scripts are located
* **browser**: Specifies which browser you want to use. The default is 'Electron', but we would typically user 'Chrome' as this represent the majority of our users.
* **ci-build-id**: to communicate the PR/Build number to the Cypress Dashboard

```yaml
      - name: E2E Smoke tests
        uses: cypress-io/github-action@v5
        # let's give this action an ID so we can refer
        # to its output values later
        id: smoke
        continue-on-error: false
        with:
          wait-on: ${{ secrets.CYPRESS_HOST }}
          wait-on-timeout: 120
          record: true
          install-command: npm ci -f
          working-directory: tool-guidance/testing
          browser: chrome
          ci-build-id: ${{ github.event.number }}
```
