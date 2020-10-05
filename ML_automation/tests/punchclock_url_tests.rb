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
	# def test_punchclock_urls
	# 	# set permission level for test	
	# 	permission = "punch_clock"
	# 	# permission	 	= TestData.get_user_fixtures["fixture_#{user_fixture_num}"]["permission_level"]
		
	# 	# find_user_for_permission(permission)

	# 	# select user fixture with matching permission 
	# 	user_fixture_num = 2 # create method to find user fixture num for fixture with matching permission
	# 	# login with that user
	# 	login_using_fixture(user_fixture_num)

	# 	# get user_id and workspace_id to ensure correct url formation
	# 	@user_id 		= get_fixture_user_id(user_fixture_num)
	# 	@workspace_id 	= get_fixture_workspace_id(user_fixture_num)

	# 	# get and output total number of urls to check for this test
	# 	total_urls 		= count_urls_for_permission		
	# 	output_intro(total_urls,permission)	

	# 	# create arrays to hold error info
	# 	@errors_404				= Array.new
	# 	@errors_permission		= Array.new

	# 	# loop through array containing all urls appropriate to this test
	# 	test_urls(total_urls)
	# 	output_errors
	# 	logout
	# end

	# same test as above, using different files for url and user data
	# for a specific user/permission level, tests to reach a set of expected urls
	def test_punchclock_urls_v2
		# set permission level for test	
		@location 		= "mwho"
		@permission 	= "punch_clock"

		#get info for user appropriate to permissions level
		@user_id 		= find_user_for_permission(@location,@permission)
		@workspace_id 	= get_user_workspace_id(@location,@user_id)

		# puts("user_id: #{@user_id}")
		# puts("workspace_id: #{@workspace_id}")

		login_with_user(@location,@user_id)
		
		# # get and output total number of urls to check for this test
		total_urls 		= count_urls_for_permission(@permission)		
		output_intro(total_urls,@permission)	

		# # create arrays to hold error info
		@errors_404				= Array.new
		@errors_permission		= Array.new

		# # loop through array containing all urls appropriate to this test
		# test_urls(total_urls)
		test_urls_for_permission(@permission)
		output_errors
		logout
	end

end