require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

require_relative '../helpers/selenium_helper'
# require_relative '../helpers/navigation_helper' # not required for direct_navigation_tests.rb
require_relative '../helpers/login_out_helper'
require_relative '../data/test_data'
# require_relative '../data/page_data' # not required for direct_navigation_tests.rb
require_relative '../data/url_data'

def verify_page_title(page_title)
	element_text = find_element(:css, ".content-title").text
	fail_info = "Expected text: #{page_title}  \nFound text: #{element_text}"
	assert_equal(element_text, page_title, fail_info)
end


def verify_page_url(nav_option)

	if nav_option === "Your Dashboard"
		page_url = PageData.your_dashboard[:page_url]
	end
	if nav_option === "Activity Feed"
		page_url = PageData.activity_feed[:page_url]
	end
	if nav_option === "Files"
		page_url = PageData.files[:page_url]
	end

	if nav_option === "Projects"
		page_url = PageData.projects[:page_url]
	end

	if nav_option === "Project Templates"
		page_url = PageData.templates[:page_url]
	end

	if nav_option === "Tasks"
		page_url = PageData.tasks[:page_url]
	end

	if nav_option === "General Settings"
		page_url = PageData.settings[:page_url]
	end

	current_url = @selenium.current_url
	fail_info = "Expected url should include: #{page_url}  \nFound url: #{current_url}"
	assert_include(current_url, page_url, fail_info)
end

def verify_direct_url(url)
	current_url = @selenium.current_url
	fail_info = "Expected url should be: #{url}  \nFound url: #{current_url}"
	assert_include(current_url, url, fail_info)

	if current_url == url
		puts("   PASS  - Found url")
	end
end

def check_for_404
	if @selenium.find_elements(:xpath, "//*[text()='404 Error']").size > 0
		puts("   404 Error")
	end
end

def check_for_502
	if @selenium.find_elements(:xpath, "//*[text()='502 Bad Gateway']").size > 0
		puts("   502 Error.  Refreshing...")
		@selenium.get(@selenium.current_url)
	end
end