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

	# tests sequential navigation for Main navigation menu
	# pass the page title text as a param

	def test_main_navigation
		login(1)

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
		logout
	end

end