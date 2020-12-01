# MavenLink Permissions Automation

## Selenium Setup (if you intend to contribute to developing the test repo)
### 1. Install Selenium IDE extension for Firefox browser
- https://addons.mozilla.org/en-US/firefox/addon/selenium-ide/
- Used to build scripts and get selectors

### 2. Install an IDE for code editing

### 3. Create Github account

## Local Setup (required to run the tests locally)
### 1. Install Firefox browser for Mac
- Firefox: https://www.mozilla.org/en-US/firefox/mac/

### 2. Use Command Line Interface for MacOS
- Terminal (installed on Macs by default)
- CMD+space, then type: `terminal`

### 3. Create local directory for the project and cd to that directory
`mkdir /Users/<your_user_name>/Projects`

`cd Projects`

### 4. Install gems
#### 4.a.  Install selenium-webdriver gem
`gem install selenium-webdriver`
#### 4.b.  Install colorize gem
`sudo gem install colorize`
#### 4.c.  Install geckodriver helper 
- Only required for MacOS 10.15 
- This is a work around for a known issue with MacOS 10.15 and geckodriver
- Source: https://rubygems.org/gems/geckodriver-helper/versions/0.0.3
  
`sudo gem install geckodriver-helper -v 0.0.3`

### 5. Clone MLautomation repo to your local directory
`git clone https://github.com/Triprime/MLautomation.git`
  

## Running Tests (instructions in rake file)
`cd ML_automation`

`rake`
