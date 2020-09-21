require_relative '../helpers/test_helper'


class NavigationTests < Test::Unit::TestCase

	def setup
		@selenium = Selenium::WebDriver.for(:firefox)
		#@selenium = Selenium::WebDriver.for(:chrome)
		login
	end

	def teardown
		logout
		@selenium.quit
	end

	# tests sequential navigation for Main navigation menu
	# pass the page title text as a param

	def test_direct_navigation
		# get expected url set from permissions level / access sum
		# url_set() = get_expected_urls_for(access_group)
		# iterate through set
			#url = url_set(i)
			url = "https://app.mwho.mvn.link/workspaces/69515/files"

			navigate_by_url_to		(url)
			verify_direct_url		(url)
			#verify_page_title		(title) #should this be required for this test?
	end

end