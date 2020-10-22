require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'
require 'colorize'

require_relative '../helpers/selenium_helper'
require_relative '../helpers/login_out_helper'
require_relative '../data/test_data'
require_relative '../data/ag_data'
require_relative '../data/user_data'

def check_for_502
	# TODO - implement retry loop instead of potential infinite loop
	if @selenium.find_elements(:xpath, "//*[text()='502 Bad Gateway']").size > 0
		puts("    502 ERROR.  Refreshing...".yellow)
		@selenium.get(@selenium.current_url)
		sleep 1
		check_for_502
	end
end

def check_for_404(full_url)
	if @selenium.find_elements(:xpath, "//*[text()='404 Error']").size > 0
		puts("    404 ERROR".red)
		@errors_404 << full_url
		return true
	else
		return false
	end
end

def check_for_privileges(full_url)
	if @selenium.find_elements(:xpath, "//*[contains(text(),'account privileges')]").size > 0
		puts("    NO PRIVILEGES".red)
		@errors_permission << full_url
		return true
	else
		return false
	end
end

def output_url_results(full_url)
	# check for errors (these do not automatically cause the test to fail)
	error = false
	if check_for_404(full_url) == true || check_for_privileges(full_url) == true
		error = true
	else
		error = false
	end

	output_url(full_url,error)
end

def output_errors
	puts("\nError counts\n   #{@errors_404.length}: 404 Error".red)
	@errors_404.each do |url|
		puts("   #{url}\n")
	end

	puts("   #{@errors_permission.length}: Permission denied".red)
	@errors_permission.each do |url|
		puts("   #{url}\n")
	end
end

def build_url(url_endpoint)
	base_url = TestData.get_base_url
	return base_url+url_endpoint 
end

def output_url(url,error)
	if error == true
		puts("    #{Time.now.strftime("%Y-%m-%d %H:%M:%S")} GET #{url}".red)
	else
		puts("    #{Time.now.strftime("%Y-%m-%d %H:%M:%S")} GET #{url}".green)
	end
end

def test_urls_for_permission(permission)
	urls_array = AGData.ag_urls_array(@user_id,@workspace_id)
	urls_array.each do |url_group|
		if url_group[:group_name] == permission
			urls = url_group[:urls]

			i = 0
			urls.each do |url_data|
				full_url = build_url(url_data[:url])
				
				puts("#{i+1}  #{url_data[:description]}")
				get_url(full_url)
				sleep 0.3
				output_url_results(full_url)

				i+=1
			end
		end
	end
end

def count_urls_for_permission(permission)
	urls_array = AGData.ag_urls_array
	urls_array.each do |url_group|
		if url_group[:group_name] == permission
			# puts("\ngroup_name:  #{url_group[:group_name]}")
			# puts("group_id:    #{url_group[:group_id]}")

			urls = url_group[:urls]
			# puts("urls to test for #{permission} permission:  #{urls.count}")
			return urls.count
		end
	end
end

def output_intro(total_urls,permission)
	puts("\nVerify that user can reach #{total_urls.to_s.yellow.bold} expected urls for permission: #{permission.yellow.bold}")
end

def find_user_for_permission(location,permission)
	user_array = UserData.users
	user_array.each do |env_group|
		if env_group[:environment] == location
			users = env_group[:users]
			users.each do |user|
				if user[:permission] == permission
					return user[:user_id]
					break  
				end
			end		
		end
	end
end

def get_user_workspace_id(location,id)
	user_array = UserData.users
	user_array.each do |env_group|
		if env_group[:environment] == location
			users = env_group[:users]
			users.each do |user|
				if user[:user_id] == id
					return user[:workspace_id]
					break  
				end
			end
		end
	end
end
