# Release Your Feature
##      Static Code Tests
*   Execute static code checks (Voters)
*   Execute security scan ([Cx](https://www.checkmarx.com/))
##      Build & Test local artifact
1. Build a npm artifact from the locat code
2. Deploy the content to a dedicated account
3. Selenium tests with the recently build artifact [see chart](./Dedicated_account.pptx)
##      Bump version & release xMake
Those steps will only be triggered if the previus ones passed sucssesfully
1. Promote the micro [version](TECHNOLOGIES_BRIEF.md) at the package.json file, i.e. the artifact version
2. Submit the changed to the [final-assembly](https://github.wdf.sap.corp/final-assembly) repository
3. Trigger [xMake](https://xmake-dev.wdf.sap.corp:8443/) job that will create an artifact and will upload it to the [internal npm](https://nexus.wdf.sap.corp:8443/nexus/content/groups/build.releases.npm/#browse/welcome)
4. Deploy the recently created/uploaded artifact to all landscapes

