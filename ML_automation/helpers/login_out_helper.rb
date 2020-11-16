def login_with_user(location,id)
	users 		= get_users_for_environment(location)
	email 		= get_user_email(users,id)
	password 	= get_user_password(users,id)
	login_url	= EnvironmentData.get_base_url+"/login"

	puts("\nLogin:  #{login_url}\nUser:  #{email}\nPermission:  #{@permission}".yellow)

	get_url(login_url)
	click(:id, "login_email_address")
	clear(:id, "login_email_address")
	send_keys(:id, "login_email_address", email )
	click(:id, "login_password")
	clear(:id, "login_password")
	send_keys(:id, "login_password", password)
	# click(:css, ".form_login__3K3lx") # seems to be deprecated as of 11/9/20
	# click(:css, ".form_form__login--3K3lx")
	click(:xpath, "//button[contains(.,'Login')]")
	close_modal()
end

def close_modal
	if @selenium.find_elements(:css, ".ui-button-icon-primary").size > 0
		puts("\nClosing modal".yellow)
		click(:css, ".ui-button-icon-primary")
	end
end

def logout
	puts("\nLogout")

	# go to dashboard. this is required if trying to logout from a 404 error page
	dashboard_url = EnvironmentData.get_base_url+"/users/#{@user_id}/dashboard"
	get_url(dashboard_url)
	sleep 0.4

	click(:css, ".user-settings-menu-toggle-name")
	click(:link_text, "Sign Out")
end

def get_users_for_environment(location)
	user_array = UserData.users
	user_array.each do |env_group|
		if env_group[:environment] == location
			users = env_group[:users]
			return users
		end
	end
end

def get_user_email(users,id)
	users.each do |user|
		if user[:user_id] == id
			return user[:email]
			break  
		end
	end
end

def get_user_password(users,id)
	users.each do |user|
		if user[:user_id] == id
			return user[:password]
			break  
		end
	end
end
