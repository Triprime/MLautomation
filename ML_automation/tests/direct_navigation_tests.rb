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

		@errors_404				= Array.new
		@errors_permission		= Array.new

		#loop through array containing all urls for this test
		i = 0
		while i < total_urls do
			# build url from base and endpoint
			url_endpoint	= UrlData.punch_clock(@user_id,@workspace_id)[i]		# full list for url testing
			base_url 		= TestData.get_base_url 
			full_url 		= base_url+url_endpoint


			# output url to check and go directly to that page via GET
			puts("#{i+1}  GET   - #{full_url}")
			navigate_by_url_to(full_url)
			# verify_direct_url(full_url)
			sleep 1

			# check for errors (these do not automatically cause the test to fail)
			check_for_502		# refreshes automatically
			check_for_404(full_url)	
			check_for_privileges(full_url)
			
			i+=1
		end

		puts("\nTotal 404 ERRORS: #{@errors_404.length}")
		@errors_404.each do |url|
			puts("   #{url}\n")
		end

		puts("Total PERMISSION ERRORS: #{@errors_permission.length}")
		@errors_permission.each do |url|
			puts("   #{url}\n")
		end

		logout
	end

end