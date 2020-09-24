require_relative '../helpers/test_helper'

class NavigationTests < Test::Unit::TestCase

	def setup
		@selenium = Selenium::WebDriver.for(:firefox)
		#@selenium = Selenium::WebDriver.for(:chrome)
	end

	def teardown
		@selenium.quit
	end

	# for a specific user/permission level, tests to reach a set of expected urls
	def test_punchclock_urls
		# select user from fixtures and login with that user
		user_fixture_num = 2
		login_with_fixture(user_fixture_num)

		# get user_id and workspace_id for ensuring correct url formation
		@user_id 		= TestData.get_user_fixtures["fixture_#{user_fixture_num}"]["user_id"]
		@workspace_id 	= TestData.get_user_fixtures["fixture_#{user_fixture_num}"]["workspace_id"]

		# get and output total number of urls to check for this test
		total_urls 		= UrlData.punch_clock().length		# full list for url testing
		permission	 	= TestData.get_user_fixtures["fixture_#{user_fixture_num}"]["permission_level"]	
		puts("\nVerify that user can reach #{total_urls} expected urls for permission level: #{permission}\n\n")

		# create arrays to hold error info
		@errors_404				= Array.new
		@errors_permission		= Array.new

		# loop through array containing all urls for this test
		test_array_of_urls(total_urls)
		output_errors
		logout
	end

end