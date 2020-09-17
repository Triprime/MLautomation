require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

require_relative '../helpers/selenium_helper'
require_relative '../helpers/navigation_helper'
#require_relative '../helpers/test_helper'
#require_relative '../helpers/test_data'
#require_relative '../helpers/page_data'

class NavigationTests < Test::Unit::TestCase

	def setup
		@selenium = Selenium::Webdriver.for(:firefox)
		login
	end

	def teardown
		logout
		@selenium.quit
	end

	

end