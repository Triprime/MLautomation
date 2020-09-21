require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

require_relative '../helpers/selenium_helper'
require_relative '../helpers/navigation_helper'
require_relative '../helpers/test_helper'
require_relative '../data/test_data'
require_relative '../data/page_data'

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
		# get url from expected set for permissions level / access sum

		#direct_navigation_to	(url)
		#verify_page_url		(url)
		#verify_page_title		(title)
	end

end