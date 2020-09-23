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
		total_urls = 	UrlData.punch_clock().length		# full list for url testing
		# total_urls 		= UrlData.punch_clock_temp().length	# short list for quick url testing
		permission	 	= TestData.get_user_fixtures["fixture_#{user_fixture_num}"]["permission_level"]	
		puts("\nVerify that user can reach #{total_urls} expected urls for permission level: #{permission}")


		#loop through array containing all urls for this test
		i = 0
		while i < total_urls do
			# build url from base and endpoint
			url_endpoint	= UrlData.punch_clock(@user_id,@workspace_id)[i]		# full list for url testing
			# url_endpoint	= UrlData.punch_clock_temp(@user_id,@workspace_id)[i] 	# short list for quick url testing
			base_url 		= TestData.get_base_url 
			full_url 		= base_url+url_endpoint


			# output url to check and directly go to that page via GET
			puts("#{i+1}  GET   - #{full_url}")
			navigate_by_url_to(full_url)
			verify_direct_url(full_url)
			

			# check for usual errors (these do not automatically cause the test to fail)
			check_for_502		# refreshes automatically
			if !check_for_404	# continue checks if no 404 encountered
				# puts("   No 404")

				# check for unique comination of elements (title and specific element)
				#verify_page_title		(title) 	
				verify_page_by_unique_element(@user_id,@workspace_id)
			else
				puts("   Continue to check next url")
				# Maybe count and output an array of urls that resulted in a 404, when test finishes
			end

			i+=1
		end

		logout
	end

end