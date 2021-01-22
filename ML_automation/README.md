# MavenLink Permissions Automation
To run the tests locally, perform the following steps.

## Staging Setup
### 1. On the Mavenlink team staging environment, create a new account and upgrade it to Premier
#### 1.a. If staging env is not up to date with production, the automation may not function correctly
#### 1.b. Use predefined user data to create the Admin account
#### 1.c. Upgrade the account to Premier
#### 1.d. Write down the account ID
#### 1.e. Enable the following feature flags on the account:
- Edit Profile in Access Groups
- Account Admins get all access group permissions (if the FF has not been removed)
- Access Control Default Access Groups
- Project Accounting Object

### 2. Using the Account Owner and predefined user data, do the following: 
#### 2.a. Invite 1 new user for each of the default permission levels
#### 2.b. Create a new Project and invite each of the new users to that project 
#### 2.c. Write down the project ID
### 3. Using Mailcatcher, accept the account invitation for each user
#### 3.a. Using predefined user data, set the password for each user  
#### 3.b. Login as each user
### 4. While logged in as each user, do the following: 
#### 4.a. For users that have permission, create a Project Template for that specific user
#### 4.b. When creating each new Template, add a Task to that template, assigned to the related user
#### 4.c. Write down the template ID


## Update repo
#### 1. In env_data.rb, add the base url for the staging environment
#### 2. In user_data.rb, add the predefined user data, and the recorded IDs for project and templates


## Local Setup
### 1. Install Firefox browser for Mac
- Firefox: https://www.mozilla.org/en-US/firefox/mac/

### 2. Create local directory for the project and cd to that directory
- Open Terminal with CMD+space, then type: `terminal`
- Create a new directory for the automation repo. Example: `mkdir /Users/<your_user_name>/Projects`
- Navigate into the new directory: `cd Projects`

### 3. Install gems
#### 3.a.  Install selenium-webdriver gem
`sudo gem install selenium-webdriver`
#### 3.b.  Install colorize gem
`sudo gem install colorize`
#### 3.c.  Install geckodriver helper 
- Only required for MacOS 10.15 
- This is a work around for a known issue with MacOS 10.15 and geckodriver
- Source: https://rubygems.org/gems/geckodriver-helper/versions/0.0.3
- `sudo gem install geckodriver-helper -v 0.0.3`

### 4. Clone MLautomation repo to your local directory
`git clone https://github.com/Triprime/MLautomation.git`
  

## Running Tests (instructions in rake file)
- `cd ML_automation`
- `rake help`
