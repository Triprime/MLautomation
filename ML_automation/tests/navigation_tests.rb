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

	def test_main_navigation
		verify_page_url		("Your Dashboard")
		verify_page_title	("Your Dashboard")

		main_navigation_to	("Projects")
		verify_page_url		("Projects")
		verify_page_title	("Projects")

		# main_navigation_to	("Project Templates")
		# verify_page_url		("Project Templates")
		# verify_page_title	("Project Templates")

		# main_navigation_to	("Tasks")
		# verify_page_url		("Tasks")
		# verify_page_title	("Tasks")

		# main_navigation_to	("General Settings")
		# verify_page_url		("General Settings")
		# verify_page_title	("General Settings")
	end

end