class UserData

	def self.users
	[
		{
			:environment 	=> "mwho",
			:users			=> [
				{
					:user_index 	=> 0,
					:user_id 		=> 41275,
					:email 			=> "mavenlinkqa@gmail.com",
					:password 		=> "password",
					:workspace_id 	=> 69515,
					:permission 	=> "account_admin"
				},
				{
					:user_index 	=> 1,
					:user_id 		=> 41485,
					:email 			=> "mavenlinkqa+mwho.ag@gmail.com",
					:password 		=> "password",
					:workspace_id 	=> 69515,
					:permission 	=> "punch_clock"	
				}
			]
		},
		{
			:environment 	=> "production",
			:users			=> [
				{
					:user_index 	=> 0,
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