Salesforce Developer CLI workflow
1. Create Salesforce project
   sf project generate --name MySalesforceProject
   cd MySalesforceProject
2. Login to Developer Org
   sf org login web --alias DevOrg
3. Retrieve metadata
   sf project retrieve start --manifest manifest/package.xml
4. Write Apex, LWC and triggers
   
   Develop your code inside the force-app/main/default directory.
5. Deploy changes
   sf project deploy start --manifest manifest/package.xml
6. Open Salesforce
   sf org open
   

# Login to sandbox
sf org login web --alias SandboxOrg --instance-url https://test.salesforce.com

# Check Org list
sf org list

Display org details:
sf org display --target-org DevOrg

Retrieve all metadata defined in your manifest:
sf project retrieve start --manifest manifest/package.xml --target-org DevOrg

Retrieve a specific Apex class:
sf project retrieve start --metadata ApexClass:AccountController --target-org DevOrg


Retrieve an Apex trigger:
sf project retrieve start --metadata ApexTrigger:AccountTrigger --target-org DevOrg


Retrieve an LWC:
sf project retrieve start --metadata LightningComponentBundle:accountSearch --target-org DevOrg

Retrieve an object:
sf project retrieve start --metadata CustomObject:Account --target-org DevOrg


Retrieve multiple metadata components:
sf project retrieve start --metadata ApexClass:AccountController ApexTrigger:AccountTrigger --target-org DevOrg


3. Deploy metadata to Salesforce
Deploy everything in package.xml:
sf project deploy start --manifest manifest/package.xml --target-org DevOrg


Deploy a specific Apex class:
sf project deploy start --metadata ApexClass:AccountController --target-org DevOrg


Deploy an LWC:
sf project deploy start --metadata LightningComponentBundle:accountSearch --target-org DevOrg


Deploy multiple components:
sf project deploy start --metadata ApexClass:AccountController ApexTrigger:AccountTrigger --target-org DevOrg


4. Deploy with Apex tests
sf project deploy start --manifest manifest/package.xml --target-org DevOrg --test-level RunLocalTests