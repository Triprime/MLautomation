def check_for_502
	# TODO - implement retry loop instead of potential infinite loop
	if element_displayed?(:xpath, "//*[text()='502 Bad Gateway']")
		puts("    502 ERROR.  Refreshing...".yellow)
		@selenium.get(@selenium.current_url)
		sleep 1
		check_for_502
	end
end

def check_for_404(full_url)
	if element_displayed?(:xpath, "//*[text()='404 Error']")
		puts("    404 ERROR".red)
		@errors_404 << full_url
		return true
	else
		return false
	end
end

def check_for_privileges(full_url)
	if 	element_displayed?(:xpath, "//*[contains(text(),'account privileges')]") ||
		element_displayed?(:xpath, "//a[contains(text(),'Back to your dashboard')]")
		puts("    NO PRIVILEGES".red)
		@errors_permission << full_url
		return true
	else
		return false
	end
end

def check_for_page_errors(full_url)
	# an error does not automatically cause the test to fail
	error_exists = false
	if check_for_404(full_url) == true || check_for_privileges(full_url) == true
		error_exists = true
	end

	return error_exists
end

def output_summary
	puts("\nResults:".bold.yellow)

	error_count_404 		= set_color_error_count_404
	error_count_permission 	= set_color_error_count_permission

	puts("404 Errors: #{error_count_404}")
	@errors_404.each do |url|
		puts("    #{url}\n")
	end

	if @actual_access_count == @expected_access_count
		access_string = "#{@actual_access_count}/#{@expected_access_count}".green
		no_access_string = "#{@actual_no_access_count}/#{@expected_no_access_count}".green
	else
		access_string = "#{@actual_access_count}/#{@expected_access_count}".yellow
		no_access_string = "#{@actual_no_access_count}/#{@expected_no_access_count}".yellow
	end

	puts("User does have access      ( #{access_string} ) actual/expected")
	puts("User does not have access  ( #{no_access_string} ) actual/expected")

	if(@should_but_didnt.count > 0)
		puts("URLS that user SHOULD have access to, but was unable to access: #{@should_but_didnt.count.to_s.bold.yellow}")
		@should_but_didnt.each do |url|
			puts("  #{url}\n")
		end
	end

	if(@shouldnt_but_did.count > 0)
		puts("URLS that user should NOT have access to, but was able to access: #{@shouldnt_but_did.count.to_s.bold.yellow}")
		@shouldnt_but_did.each do |url|
			puts("  #{url}\n")
		end
	end

	# puts("Permission denied: #{error_count_permission}")
	# @errors_permission.each do |url|
	# 	puts("    #{url}\n")
	# end

end

def set_color_error_count_404
	colorized_string = ""
	if @errors_404.length > 0
		colorized_string = "#{@errors_404.length}".red
	else
		colorized_string = "#{@errors_404.length}".green
	end
	return colorized_string
end

def set_color_error_count_permission
	colorized_string = ""
	if @errors_permission.length > 0
		colorized_string = "#{@errors_permission.length}".red
	else
		colorized_string = "#{@errors_permission.length}".green
	end
	return colorized_string
end


def build_url(url_endpoint)
	base_url = EnvironmentData.get_base_url
	return base_url+url_endpoint 
end

def output_url(url,error_exists)
	if error_exists == true
		url_result = "GET #{url}".red
	else
		url_result = "GET #{url}".green
	end

	# puts("    #{Time.now.strftime("%Y-%m-%d %H:%M:%S")} #{url_result}")
	puts("    #{url_result}")
end

def test_urls_for_permission(group_name,expectation)
	urls_array = AGData.ag_urls_array(@user_id,@workspace_id)
	urls_array.each do |url_group|
		if url_group[:group_name] == group_name
			urls = url_group[:urls]

			i = 1
			urls.each do |url_data|
				full_url = build_url(url_data[:url])
				
				puts("#{i}  #{url_data[:description]}")
				get_url(full_url)
				sleep 0.3
				error_exists = check_for_page_errors(full_url)
				output_url(full_url,error_exists)
				update_counts(error_exists,expectation)
				update_arrays(full_url,error_exists,expectation)

				i+=1
			end
		end
	end
end

def count_urls_for_group(group_name)
	urls_array = AGData.ag_urls_array
	urls_array.each do |url_group|
		if url_group[:group_name] == group_name
			return url_group[:urls].count
		end
	end
end

def output_intro(url_group,user_permission,expectation)
	if expectation == false
		expectation_string = "false".red.bold
	else
		expectation_string = "true".green.bold
	end

	total_urls = count_urls_for_group(url_group)
	puts("\nVerify if user can reach #{total_urls.to_s.yellow.bold} urls for access group: #{url_group.yellow.bold}.")
	puts("Expect that user with permission #{user_permission.yellow.bold} has access: #{expectation_string}")
	# puts("\n")
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
				# else
				# 	puts("No user_id found for permission: #{permission} and environment: #{location}")  
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
				# else
				# 	puts("No workspace_id found for user_id: #{id} and environment: #{location}")    
				end
			end
		end
	end
end

def set_expectation(url_group,user_permission)
	expectation = false
	included_url_groups = get_included_url_groups(user_permission)
	# puts("Included url groups: #{included_url_groups}")

	if url_group == user_permission 
		expectation = true
	elsif included_url_groups.include? url_group
		expectation = true		
	end

	return expectation
end

def get_included_url_groups(user_permission)
	urls_array = AGData.ag_urls_array
	urls_array.each do |url_group|
		if url_group[:group_name] == user_permission
			return url_group[:included_url_groups]
		end
	end
end

def update_counts(error_exists,expectation)
	if expectation == true && error_exists == false
		@expected_access_count+=1
		# @expected_no_access_count+=1
		@actual_access_count+=1
		# @actual_no_access_count+=1
	elsif 	expectation == true && error_exists == true
		@expected_access_count+=1
		# @expected_no_access_count+=1
		# @actual_access_count+=1
		@actual_no_access_count+=1
	elsif 	expectation == false && error_exists == true
		# @expected_access_count+=1
		@expected_no_access_count+=1
		# @actual_access_count+=1
		@actual_no_access_count+=1
	elsif 	expectation == false && error_exists == false
		# @expected_access_count+=1
		@expected_no_access_count+=1
		@actual_access_count+=1
		# @actual_no_access_count+=1
	end
end

def update_arrays(full_url,error_exists,expectation)
	if expectation == true && error_exists == true
		@should_but_didnt << full_url
	elsif 	expectation == false && error_exists == false
		@shouldnt_but_did << full_url
	end
end

def initialize_variables
	# arrays to hold error info
	@errors_404				= Array.new
	@errors_permission		= Array.new
	@should_but_didnt		= Array.new
	@shouldnt_but_did		= Array.new
	# counters for errors
	@expected_access_count		= 0
	@expected_no_access_count	= 0
	@actual_access_count		= 0
	@actual_no_access_count		= 0
end

def set_url_groups
	if (ENV['urls'] == "all_defaults" || ENV['urls'] == "admin" || ENV['urls'] == "")
		urls_to_test = ["punch_clock","collaborator","project_creator","project_lead","report_viewer","report_viewer_with_cost","admin"]
	elsif (ENV['urls'] == "rvc" || ENV['urls'] == "report_viewer_with_cost")
		urls_to_test = ["punch_clock","collaborator","project_creator","project_lead","report_viewer","report_viewer_with_cost"]
	elsif (ENV['urls'] == "rv" || ENV['urls'] == "report_viewer")
		urls_to_test = ["punch_clock","collaborator","project_creator","project_lead","report_viewer"]
	elsif (ENV['urls'] == "prl" || ENV['urls'] == "punch_lead")
		urls_to_test = ["punch_clock","collaborator","project_creator","project_lead"]
	elsif (ENV['urls'] == "prc" || ENV['urls'] == "project_creator")
		urls_to_test = ["punch_clock","collaborator","project_creator"]
	elsif (ENV['urls'] == "co" || ENV['urls'] == "collaborator")
		urls_to_test = ["punch_clock","collaborator"]
	elsif (ENV['urls'] == "pc" || ENV['urls'] == "punch_clock")
		urls_to_test = ["punch_clock"]
	end

	return urls_to_test			
end