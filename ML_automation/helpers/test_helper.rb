
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
	if (@selenium.find_elements(:xpath, "//*[contains(text(),'account privileges')]").size > 0 ||
		@selenium.find_elements(:xpath, "//a[contains(text(),'Back to your dashboard')]").size > 0)
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
	puts("\nResults:")

	error_count_404 = ""
	error_count_permission = ""

	if @errors_404.length > 0
		error_count_404 = "#{@errors_404.length}".red
	else
		error_count_404 = "#{@errors_404.length}".green
	end

	if @errors_permission.length > 0
		error_count_permission = "#{@errors_permission.length}".red
	else
		error_count_permission = "#{@errors_permission.length}".green
	end

	if @actual_access == @expected_access
		access_string = "#{@actual_access}/#{@expected_access}".green
		no_access_string = "#{@actual_no_access}/#{@expected_no_access}".green
	else
		access_string = "#{@actual_access}/#{@expected_access}".red
		no_access_string = "#{@actual_no_access}/#{@expected_no_access}".red
	end

	puts("Expect user has access     (#{access_string})")
	puts("Expect user has no access  (#{no_access_string})")

	puts("#{error_count_404} - 404 Error")
	@errors_404.each do |url|
		puts("      #{url}\n")
	end

	puts("#{error_count_permission} - Permission denied")
	@errors_permission.each do |url|
		puts("      #{url}\n")
	end
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
	puts("\nVerify if user can reach #{total_urls.to_s.yellow.bold} urls for url_group: #{url_group.yellow.bold}.")
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
		@expected_access+=1
		# @expected_no_access+=1
		@actual_access+=1
		# @actual_no_access+=1
	elsif 	expectation == true && error_exists == true
		@expected_access+=1
		# @expected_no_access+=1
		# @actual_access+=1
		@actual_no_access+=1
	elsif 	expectation == false && error_exists == true
		# @expected_access+=1
		@expected_no_access+=1
		# @actual_access+=1
		@actual_no_access+=1
	elsif 	expectation == false && error_exists == false
		# @expected_access+=1
		@expected_no_access+=1
		@actual_access+=1
		# @actual_no_access+=1
	end
end

def initialize_variables
	# arrays to hold error info
	@errors_404				= Array.new
	@errors_permission		= Array.new
	@expected_access		= 0
	@expected_no_access		= 0
	@actual_access			= 0
	@actual_no_access		= 0
end