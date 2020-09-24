require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

require_relative '../helpers/selenium_helper'
# require_relative '../helpers/navigation_helper' # not required for direct_navigation_tests.rb
require_relative '../helpers/login_out_helper'
require_relative '../data/test_data'
require_relative '../data/page_data' # not required for direct_navigation_tests.rb
require_relative '../data/url_data'

def check_for_502
	if @selenium.find_elements(:xpath, "//*[text()='502 Bad Gateway']").size > 0
		puts("    502 ERROR.  Refreshing...")
		@selenium.get(@selenium.current_url)
		sleep 1
	end
end

def check_for_404(full_url)
	if @selenium.find_elements(:xpath, "//*[text()='404 Error']").size > 0
		puts("    404 ERROR")
		@errors_404 << full_url
	# else
	# 	puts("   No 404")
	end
end

# You don't have account privileges
def check_for_privileges(full_url)
	if @selenium.find_elements(:xpath, "//*[contains(text(),'account privileges')]").size > 0
		puts("    NO PRIVILEGES")
		@errors_permission << full_url
	end
end

def output_errors
	puts("\nTotal 404 ERRORS: #{@errors_404.length}")
	@errors_404.each do |url|
		puts("   #{url}\n")
	end

	puts("\nTotal PERMISSION ERRORS: #{@errors_permission.length}")
	@errors_permission.each do |url|
		puts("   #{url}\n")
	end
end

def build_url(i)
	url_endpoint	= UrlData.punch_clock(@user_id,@workspace_id)[i]		# full list for url testing
	base_url 		= TestData.get_base_url
	return base_url+url_endpoint 
end

def output_url(i,url)
	puts("#{i+1}  GET   - #{url}")
end

def	test_array_of_urls(total_urls)
	i = 0
	while i < total_urls do
		full_url = build_url(i)
		output_url(i,full_url)
		get_url(full_url)
		# verify_direct_url(full_url)
		sleep 1

		# check for errors (these do not automatically cause the test to fail)
		check_for_502		# refreshes automatically
		check_for_404(full_url)	
		check_for_privileges(full_url)
		
		i+=1
	end
end

# def verify_page_title(page_title)
# 	element_text = find_element(:css, ".content-title").text
# 	fail_info = "Expected text: #{page_title}  \nFound text: #{element_text}"
# 	assert_equal(element_text, page_title, fail_info)
# end


# def verify_page_url(nav_option)

# 	if nav_option === "Your Dashboard"
# 		page_url = PageData.your_dashboard[:page_url]
# 	end
# 	if nav_option === "Activity Feed"
# 		page_url = PageData.activity_feed[:page_url]
# 	end
# 	if nav_option === "Files"
# 		page_url = PageData.files[:page_url]
# 	end

# 	if nav_option === "Projects"
# 		page_url = PageData.projects[:page_url]
# 	end

# 	if nav_option === "Project Templates"
# 		page_url = PageData.templates[:page_url]
# 	end

# 	if nav_option === "Tasks"
# 		page_url = PageData.tasks[:page_url]
# 	end

# 	if nav_option === "General Settings"
# 		page_url = PageData.settings[:page_url]
# 	end

# 	current_url = @selenium.current_url
# 	fail_info = "Expected url should include: #{page_url}  \nFound url: #{current_url}"
# 	assert_include(current_url, page_url, fail_info)
# end

# def verify_direct_url(url)
# 	current_url = @selenium.current_url
# 	fail_info = "Expected url should be: #{url}  \nFound url: #{current_url}"
# 	assert_include(current_url, url, fail_info)

# 	# uncomment to help identify malformed urls
# 	# if current_url == url
# 	# 	puts("   PASS  - Found url")
# 	# end
# end

# def verify_page_by_unique_element(user_id, workspace_id)
# 	current_url = @selenium.current_url

# 	total_urls = PageData.unique_elements(user_id,workspace_id).length

# 	i = 0
# 	while i < total_urls
# 		url_endpoint	= PageData.unique_elements(user_id,workspace_id)[i][0]
# 		base_url 		= TestData.get_base_url 
# 		full_url 		= base_url+url_endpoint

# 		if current_url.include?(full_url)
# 			locator_type = PageData.unique_elements(user_id,workspace_id)[i][1]
# 			locator 	 = PageData.unique_elements(user_id,workspace_id)[i][2]

# 			if @selenium.find_elements(locator_type,locator).size > 0
# 				puts("    Found (#{locator_type} #{locator})")
# 			else
# 				puts("	 NOT Found (#{locator_type} #{locator}).\n	 Continuing...")
# 			end
# 		end
# 		i+=1
# 	end
# end