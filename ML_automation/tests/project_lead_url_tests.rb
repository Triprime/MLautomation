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
		# create arrays to hold error info
		@errors_404				= Array.new
		@errors_permission		= Array.new

		# array of urls to test for user access
		url_group = "project_lead"

		# before running test, set an environment variable in the terminal like so:
		# export environment=mwho

		# set permission level and environment for test	
		# location 		= ENV['environment'] # this only works if an environment variable is set
		location 	= "mwho" # if an environment variable is not set, then explicitly use this environment
		permission 	= "project_lead"

		#get info for user appropriate to permissions type
		@user_id 		= find_user_for_permission(location,permission)
		@workspace_id 	= get_user_workspace_id(location,@user_id)

		login_with_user(location,@user_id,permission)

		# set expectation for url_group based on user permission
		expectation = set_expectation(url_group,permission)
		# get and output total number of urls to check during this test
		output_intro(url_group,permission,expectation)		
		# loop through access_group array containing all urls appropriate to this test
		test_urls_for_permission(url_group)

		output_error_summary
		logout
	end

end