[![Lifecycle:Experimental](https://img.shields.io/badge/Lifecycle-Experimental-339999)](Redirect-URL)[![Test Automation Guidance](https://img.shields.io/endpoint?url=https://cloud.cypress.io/badge/simple/4c5wm1/main&style=flat&logo=cypress)](https://cloud.cypress.io/projects/4c5wm1/runs)

# Automated Testing Guidance

> **TLDR:** Let's install Cypress - Follow the intructions [here](https://github.com/bcgov/automated-testing/tree/main/tool-guidance#readme), to get you moving. Read the [wiki](https://github.com/bcgov/automated-testing/wiki) for more background.

This repo contains the source code and examples for the E2E Automated Testing Guidance using Cypress.

The guidance is documented in the [wiki](https://github.com/bcgov/automated-testing/wiki) and throughout the repo in the apprpriate `README`.

## What is in the directories?

The info provided here is code, utilities and guidance. When starting with test automation with Cypress it is important that you use [our install procedure](https://github.com/bcgov/automated-testing/tree/main/tool-guidance#readme) for the tool. **_Do not clone the repo!_** The install procedure will ask you a few question and then set you up correctly.

### _.github/workflows_

Contains 2 sample workflows for running Cypress in Github actions and a full description of what is contained in the complex workflow. You can use this as a starting point for your own implementation.

### _docs_

Contains the [wiki](https://github.com/bcgov/automated-testing/wiki) documents. Updates to the wiki will be stored here and then propagated to the wiki.

### _media_

Contains the media files used in our README-s and the Wiki.

### _survey_

Contains the survey results that drove the direction of this guidance.

### _tool-guidance_

Contains the 'meat' of the guidance and the code.

### _tool-guidance/containers_

Contains the Docker container for Cypress and Build and Deployment Configurations for OpenShift. These are examples, so you have to adjust them yourself.

### _tool-guidance/library_

Contains all the packages, code, utilities that are installed by our install script. It also contains the detailed readme-s for each of the packages.

### _tool-guidance/recipes_

Contains the big README file to get you started with the packages. Go here to start to undertsand what the additional packages are about.

### _tool-guidance/testing_

Contains the result of the latest install, so that we can test it in this repo. This is **not meant to be copied**, you have to create your own install with the install.sh script.

## Useful Resources

- Official Cypress Documentation: https://docs.cypress.io/
- Cypress GitHub Repository: https://github.com/cypress-io/cypress
- Cypress Example Recipes: https://github.com/cypress-io/cypress-example-recipes
- Cypress Community: https://www.cypress.io/community/
