require_relative '../helpers/test_helper'

class NavigationTests < Test::Unit::TestCase

	def setup
		@selenium = Selenium::WebDriver.for(:firefox)
	end

	def teardown
		@selenium.quit
	end

	# for a specific user/permission level, tests to reach a set of expected urls
	def test_punchclock_urls
		# set permission level and environment for test	
		@location 		= "mwho"
		@permission 	= "punch_clock"

		#get info for user appropriate to permissions type
		@user_id 		= find_user_for_permission(@location,@permission)
		@workspace_id 	= get_user_workspace_id(@location,@user_id)

		login_with_user(@location,@user_id)
		
		# get and output total number of urls to check for this test
		total_urls 		= count_urls_for_permission(@permission)		
		output_intro(total_urls,@permission)	

		# create arrays to hold error info
		@errors_404				= Array.new
		@errors_permission		= Array.new

		# loop through access_group array containing all urls appropriate to this test
		test_urls_for_permission(@permission)
		output_errors
		logout
	end

end