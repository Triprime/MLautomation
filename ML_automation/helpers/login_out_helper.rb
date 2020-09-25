def login_using_fixture(num)
	fixture_num = "fixture_#{num}"
	email 		= TestData.get_user_fixtures[fixture_num]["email"]
	password 	= TestData.get_user_fixtures[fixture_num]["password"]
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
