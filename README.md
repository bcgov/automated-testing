[![Lifecycle:Experimental](https://img.shields.io/badge/Lifecycle-Experimental-339999)](Redirect-URL)[![Test Automation Guidance](https://img.shields.io/endpoint?url=https://cloud.cypress.io/badge/simple/4c5wm1/main&style=flat&logo=cypress)](https://cloud.cypress.io/projects/4c5wm1/runs)

# Automated Testing Guidance

> **TLDR:** Let's install Cypress - Follow the intructions [here](https://github.com/bcgov/automated-testing/tree/main/tool-guidance#readme), to get you moving.

This repo contains the source code and examples for the E2E Automated Testing Guidance using Cypress.

The guidance is documented in the [wiki](https://github.com/bcgov/automated-testing/wiki) and throughout the repo in the apprpriate `README`.

## What is in the directories?

The info provided here is code, utilities and guidance. When starting with test automation with Cypress it is important that you use our install procedure for the tool. **_Do not clone the repo!_** The install procedure will set you up correctly,

### .github/workflows

Contains 2 sample workflows for running Cypress in Github actions and a full description of what is contained in the complex workflow. You can use this as a starting point for your own implementation.

### media

Contains the media files used in our README-s and the Wiki.

### survey

Contains the survey results that drove the direction of this guidance.

### tool-guidance

Contains the 'meat' of the guidance and the code.

#### tool-guidance/containers

Contains the Docker container for Cypress and Build and Deployment Configurations for OpenShift. These are examples, so you have to adjust them yourself.

#### tool-guidance/library

Contains all the packages, code, utilities that are installed by our install script. It also contains the detailed readme-s for each of the packages.

#### tool-guidance/recipes

Contains the big README file to get you started with the packages. Go here to start to undertsand what the additional packages are about.

#### tool-guidance/testing

Contains the result of the latest install, so that we can test it in this repo. This is **not meant to be copied**, you have to create your own install with the install.sh script.
