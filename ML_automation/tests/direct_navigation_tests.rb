require_relative '../helpers/test_helper'


class NavigationTests < Test::Unit::TestCase

	def setup
		@selenium = Selenium::WebDriver.for(:firefox)
		#@selenium = Selenium::WebDriver.for(:chrome)
	end

	def teardown
		@selenium.quit
	end

	# tests navigation by url for a set of urls expected for a specific permissions level
	def test_direct_navigation
		user_fixture_num = 2
		login(user_fixture_num)

		total_urls = 	UrlData.punch_clock.length
		puts("Verify that user can reach #{total_urls} urls")

		i = 0
		while i < total_urls do
			url_endpoint	= UrlData.punch_clock[i]
			base_url 		= TestData.get_base_url 
			full_url 		= base_url+url_endpoint

			puts("#{i+1}  Attempt - #{full_url}")
			navigate_by_url_to(full_url)
			verify_direct_url(full_url)
			#verify_page_title		(title) #should this be required for this test?
			i+=1
		end
		logout
	end

end