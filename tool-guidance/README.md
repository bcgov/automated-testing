# Tool Guidance: Cypress
BCGov Template for Cypress containing key integration points

To install Cypress and tools on your machine:
* copy install.sh to your machine (make sure you make it executable ```chmod +x install.sh```)
* Create a root directory for your tests (testing is good)
* ```./install.sh```
* Answer questions (currently only js supported)
* It will generate a install file which you can run later or immediately.
* Half way through the install Cypress will open and you have to make a choice, please select E2E Testing
* Then you can choose to copy in the examples or just an empty template
* After that close Cypress browser and app
* install.sh will finish

The ```testing``` directory in this repo represents the result of running the install with all the options. You should always use the install procedure and not copy this directory to ensure you always install the latest versions of Cypress and libraries. 
