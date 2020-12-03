require_relative '../helpers/require_helper'
# This test will login with a user who has a specific permission,
# then verify if that user has access to urls they should be able to access,
# and verify if that user has access to urls they should NOT be able to access.
# The test uses direct url GETs instead of UI navigation.

class NavigationTests < Test::Unit::TestCase

	def setup
		@selenium = Selenium::WebDriver.for(:firefox)
	end

	def teardown
		@selenium.quit
	end

	def test_urls
		initialize_variables
		location 		= ENV['environment'] 
		permission 		= ENV['permission']
		url_groups 		= set_url_groups
		@user_id 		= get_user_id(location,permission)
		@workspace_id 	= get_user_workspace_id(location,@user_id)
		@template_id	= get_user_template_id(location,@user_id)

		login_with_user(location,@user_id,permission)
		url_groups.each do |url_group|
			expectation = set_expectation(url_group,permission)
			output_intro(url_group,permission,expectation)	
			test_urls_for_permission(url_group,expectation)
		end

		output_summary
		logout
	end

end