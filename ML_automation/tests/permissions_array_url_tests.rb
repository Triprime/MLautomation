require_relative '../helpers/require_helper'
# This test will login with a user who has a specific permission,
# then verify if that user has access to urls they should be able to access,
# and verify if that user has access to urls they should NOT be able to access.
# The test uses direct url GETs instead of UI navigation.

# Before running test, set an environment variable in the terminal like so:
# export environment=mwho
# Alternatively, explicitly set the environment in the test method

class NavigationTests < Test::Unit::TestCase

	def setup
		@selenium = Selenium::WebDriver.for(:firefox)
	end

	def teardown
		@selenium.quit
	end

	def test_urls
		initialize_variables

		# if an environment variable IS set via the terminal...
		location 		= ENV['environment'] # this only works if an environment variable is set
		# if an environment variable IS NOT set via the terminal...
		# manually set testing environment by hardcoding it here
		# location 		= "mwho" 
		
		# set user permission level (pick one)
		permission 		= "punch_clock"
		# permission 		= "collaborator"
		# permission 		= "project_creator"
		# permission 		= "project_lead"

		# arrays of urls to test for user access
		url_groups = ["punch_clock",
			"collaborator",
			"project_creator",
			"project_lead"
			]

		# based on user permisson, get user info necessary for login and testing
		@user_id 		= find_user_for_permission(location,permission)
		@workspace_id 	= get_user_workspace_id(location,@user_id)
		login_with_user(location,@user_id,permission)

		# test each url_group
		url_groups.each do |url_group|
			# set test expectation for url_group based on user permission
			expectation = set_expectation(url_group,permission)
			# output info about each test group
			output_intro(url_group,permission,expectation)	
			# verify if user can access each url in specific url_group
			test_urls_for_permission(url_group,expectation)
		end

		output_summary
		logout
	end

end