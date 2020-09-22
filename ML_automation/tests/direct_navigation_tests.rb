require_relative '../helpers/test_helper'


class NavigationTests < Test::Unit::TestCase

	# $user_fixture_num = 2

	def setup
		@selenium = Selenium::WebDriver.for(:firefox)
		#@selenium = Selenium::WebDriver.for(:chrome)
	end

	def teardown
		@selenium.quit
	end

	# for a specific user/permission level, tests to reach a set of expected urls
	def test_punchclock_urls
		user_fixture_num = 2
		login_with_fixture(user_fixture_num)

		@user_id 		= TestData.get_user_fixtures["fixture_#{user_fixture_num}"]["user_id"]
		@workspace_id 	= TestData.get_user_fixtures["fixture_#{user_fixture_num}"]["workspace_id"]

		total_urls = 	UrlData.punch_clock_temp().length	# remove _temp for full url testing
		puts("Verify that user can reach #{total_urls} urls")

		i = 0
		while i < total_urls do
			# url_endpoint	= UrlData.punch_clock[i]
			url_endpoint	= UrlData.punch_clock_temp(@user_id,@workspace_id)[i] # remove _temp for full url testing
			base_url 		= TestData.get_base_url 
			full_url 		= base_url+url_endpoint

			puts("#{i+1}  Attempt - #{full_url}")
			navigate_by_url_to(full_url)
			verify_direct_url(full_url)
			#verify_page_title		(title) # should this check be required for this test?
			i+=1
		end
		logout
	end

end