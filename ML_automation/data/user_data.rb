class UserData

	def self.users
	[
		{
			:environment 	=> "mwho",
			:users			=> [
				# {
				# 	:user_id 		=> 41275,
				# 	:email 			=> "mavenlinkqa@gmail.com",
				# 	:password 		=> "password",
				# 	:workspace_id 	=> 69515,
				# 	:permission 	=> "account_admin"
				# },
				# {
				# 	:user_id 		=> 41485,
				# 	:email 			=> "mavenlinkqa+mwho.ag@gmail.com",
				# 	:password 		=> "password",
				# 	:workspace_id 	=> 69515,
				# 	:permission 	=> "punch_clock"	
				# },
				{
					:user_id 		=> 41545,
					:email 			=> "mavenlinkqa+automation@gmail.com",
					:password 		=> "password",
					:workspace_id 	=> 69665,
					:permission 	=> "account_admin"
				},
				{
					:user_id 		=> 41555,
					:email 			=> "mavenlinkqa+auto.pc@gmail.com",
					:password 		=> "password",
					:workspace_id 	=> 69665,
					:permission 	=> "punch_clock"	
				}
			]
		},
		{
			:environment 	=> "production",
			:users			=> [
				{
					:user_id 		=> 00001,
					:email 			=> "email.goes.here@gmail.com",
					:password 		=> "password_goes_here",
					:workspace_id 	=> 00001,
					:permission 	=> "account_admin"
				}
			]
		}
	]
	end

end