require_relative '../helpers/test_helper'


class NavigationTests < Test::Unit::TestCase

	def setup
		@selenium = Selenium::WebDriver.for(:firefox)
		#@selenium = Selenium::WebDriver.for(:chrome)
		# login
	end

	def teardown
		# logout
		@selenium.quit
	end

	# tests navigation by url for a set of urls expected for a specific permissions level

	def test_direct_navigation
		login(2)

		last = 	UrlData.punch_clock.length
		puts("Total urls: #{last}")

		i = 0
		while i < last do
			url = UrlData.punch_clock[i]

			puts("#{i+1}  Nav to  #{url}")
			navigate_by_url_to		(url)
			verify_direct_url		(url)
			#verify_page_title		(title) #should this be required for this test?
			i+=1
		end
		logout
	end

end