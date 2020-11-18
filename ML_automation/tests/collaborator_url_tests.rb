require_relative '../helpers/require_helper'

class NavigationTests < Test::Unit::TestCase

	def setup
		@selenium = Selenium::WebDriver.for(:firefox)
	end

	def teardown
		@selenium.quit
	end

	# for a specific user/permission level, tests to reach a set of expected urls
	def test_urls
		# arrays to hold error info
		@errors_404				= Array.new
		@errors_permission		= Array.new

		# array of urls to test for user access
		url_group = "collaborator"

		# before running test, set an environment variable in the terminal like so:
		# export environment=mwho
		# location 		= ENV['environment'] # this only works if an environment variable is set

		# if an environment variable is not set via the terminal...
		# manually set testing environment by hardcoding it in this test spec
		location 		= "mwho" 
		permission 		= "collaborator" # set user permission level

		# based on user permisson, get user info necessary for login and testing
		@user_id 		= find_user_for_permission(location,permission)
		@workspace_id 	= get_user_workspace_id(location,@user_id)
		login_with_user(location,@user_id,permission)

		# set test expectation for url_group based on user permission
		expectation = set_expectation(url_group,permission)
		# output info about each test group
		output_intro(url_group,permission,expectation)		
		# verify if user can access each url in specific url_group
		test_urls_for_permission(url_group,expectation)

		output_error_summary
		logout
	end

end