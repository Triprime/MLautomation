def login_with_user(location,id)
	email 		= get_user_email(location,id)
	password 	= get_user_password(location,id)
	login_url	= TestData.get_base_url+"/login"

	puts("User:  #{email}\nLogin: #{login_url}")

	get_url(login_url)
	click(:id, "login_email_address")
	clear(:id, "login_email_address")
	send_keys(:id, "login_email_address", email )
	click(:id, "login_password")
	clear(:id, "login_password")
	send_keys(:id, "login_password", password)
	click(:css, ".form_login__3K3lx")
end

def logout
	puts("\nLogout")

	click(:css, ".user-settings-menu-toggle-name")
	click(:link_text, "Sign Out")
end

def get_user_email(location,id)
	user_array = UserData.users
	user_array.each do |env_group|
		if env_group[:environment] == location
			users = env_group[:users]
			users.each do |user|
				if user[:user_id] == id
					return user[:email]
					break  
				end
			end
		end
	end
end

def get_user_password(location,id)
	user_array = UserData.users
	user_array.each do |env_group|
		if env_group[:environment] == location
			users = env_group[:users]
			users.each do |user|
				if user[:user_id] == id
					return user[:password]
					break  
				end
			end
		end
	end
end