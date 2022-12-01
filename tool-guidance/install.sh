#!/bin/bash
echo "*************************************************************"
echo "*                Cypress Configurator                       *"
echo "*************************************************************"
rm -f installconfig.sh
touch installconfig.sh
chmod +x installconfig.sh

read -p "What is your path for your root testing directory [$PWD]? " testpath
testpath=${testpath:-$PWD}

read -p "Do you use ([js]/ts)?" code
code=${code:-"js"}
if [[ $code == 'ts' ]]
then
  echo "npm install --save-dev typescript" >> installconfig.sh
fi

echo "npm install --save-dev cypress@10.11.0" >> installconfig.sh

read -p "Simple install or advanced? ([s]/a)?" level
level=${level:-"s"}
if [[ $level == 'a' ]]
then
  echo "Do you need keycloak support? (y/n)"
  read keycloak
  if [[ $keycloak == 'y' ]]
  then
    echo "npm install --save-dev cypress-keycloak" >> installconfig.sh
  fi
  echo "Do you need file upload support? (y/n)"
  read fileupload
  if [[ $fileupload == 'y' ]]
  then
    echo "npm install --save-dev cypress-file-upload" >> installconfig.sh
  fi
  echo "Do you need randomized input support? (y/n)"
  read random
  if [[ $random == 'y' ]]
  then
    echo "npm install @faker-js/faker --save-dev" >> installconfig.sh
  fi
  echo "Do you need API testing support? (y/n)"
  read api
  if [[ $api == 'y' ]]
  then
    echo "npm install cypress-plugin-api --save-dev" >> installconfig.sh
  fi
fi
echo ""
cat installconfig.sh
echo ""
echo "*************************************************************"
echo "*   Your selections have been stored in installconfig.sh    *"
echo "*************************************************************"
echo ""
echo "Do you want to run this script now? (y/n)"
read answer
if [[ $answer == 'y' ]]
then
 source $testpath/installconfig.sh
 rm -f $testpath/installconfig.sh
 npm audit fix --force
 npx cypress open
 touch $testpath/sample.cypress.env.json
 mkdir $testpath/cypress/e2e/examples
  if [[ $code == 'ts' ]]
  then
    curl 'https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/library/tsconfig.json?' >> $testpath/tsconfig.json
    curl 'https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/library/tslint.json?' >> $testpath/tslint.json
  fi
  if [[ $fileupload == 'y' ]]
  then
    curl 'https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/library/file-upload/commands.js?' >> $testpath/cypress/support/commands.js
    mkdir $testpath/cypress/e2e/examples/file-upload-example
  fi 
  if [[ $random == 'y' ]]
  then
    mkdir $testpath/cypress/e2e/examples/faker-example
    curl 'https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/library/faker/example/faker-example.cy.js' >> $testpath/cypress/e2e/examples/faker-example/faker-example.cy.js
  fi 
  if [[ $api == 'y' ]]
  then
    mkdir $testpath/cypress/e2e/examples/api-example
    curl 'https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/library/api/example/api-example.cy.js' >> $testpath/cypress/e2e/examples/api-example/api-example.cy.js
    curl 'https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/library/api/commands.js' >> $testpath/cypress/support/commands.js
  fi 
  if [[ $keycloak == 'y' ]]
  then
    curl 'https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/library/keycloak/commands.js' >> $testpath/cypress/support/commands.js
    curl 'https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/library/keycloak/sample.cypress.env.json' >> $testpath/sample.cypress.env.json
    mkdir $testpath/cypress/e2e/examples/keycloak-example
    curl 'https://raw.githubusercontent.com/bcgov/automated-testing/main/tool-guidance/library/keycloak/example/keycloak-example.cy.js' >> $testpath/cypress/e2e/examples/keycloak-example/keycloak-example.cy.js
  fi 
  if [[ $code == 'ts' ]]
  then
    cd $testpath/cypress
    du -a . | grep .cy.js | awk '{print "mv -v " $2 " " $2 }' | sed 's/\(\b[\.]js$\)/\.ts/g' | bash
  fi  
fi
echo ""
echo "Install Complete!"

