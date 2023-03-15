# How to select a tool?

We looked for a tool to support UI end-to-end testing. 
And within our context, the key requirements for a UI Test Automation Tool are:
* Alignment with used technology, stacks and libraries
* Familiar scripting language
* Great online support (company, community)
* Capability to run locally, dockerized, CI (GitHub and OpenShift)
* Mature framework that is maintained/updated/supported
* Popular in the market (not an exotic niche product)
* Extensible (KeyCloak, Reporting, Specialized libraries etc.)
* Previous experience of teams

For this we published a survey for our community to understand what they are currently using and what their experiences are. The results of the survey are summarized [here](https://github.com/bcgov/automated-testing/blob/293850168303b7e4a59c860a7ae27f9897585528/survey/Test%20Automation%20Survey.pdf).

Before the survey, we did an quick evaluation of some of the tools out there in the field based on some key requirements.
The products below are scored form 0-5, 5 being the most in line with the requirement.

Requirement | Cypress | Nightwatch | Playwright | BDDStack |Cucumber | Jest | Mocha 
----------- | ------: | ------: | ------: | ------: | ------: | ------: | ------:  
UI E2E testing tool | 5 | 4 | 5 | 4 | 4 | 2 | 2
NodeJS based | 5 | 5 | 5 | 0 | 4 | 5 | 5
BDD Compatible | 3 - not out of the box | 2 - not out of the box | 2 - not out of the box  | 5 | 5 | 3 | 3
Stability of tool | 4 | 4 | 3 - New tool | 2 | 5 | 5 | 5
Selenium Based | 5 - No | 2 - Yes | 5 - No | 2 - Yes |  2- Yes | 2 - Yes | 2- Yes
Completeness | 5 | 2 | 2 | 4 | 3 | 3 | 3
Browser Support | 3 | 1 | 3 | 4 | 4 | 2 | 2
BrowserStack Integration | Yes - 5 | Yes -5 | Yes -3 | Yes -5 | Yes - 4 | Yes -3 | Yes - 3
**Total** | **27** | **21**| **21** | **24** | **31** | **25** | **25**


Even though Cucumber scored high, particularly if you look at the BDD support but Cypress is a more full-fledged an modern tool that does provide excellent support and productivity improvements over some of the other tools.

Also the fact hat Cypress has been used by other parties in the sector and completely aligns with our tool and platforms choice while still providing the integration capabilities with tools like BrowserStack.

# Result

Both the community survey and our own evaluation showed [Cypress](https://cypress.io) as a popular and capable choice. Therefore the guidance in the wiki will be based on that.







