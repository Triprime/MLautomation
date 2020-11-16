class UserData

	def self.users
	[
		{
			:environment 	=> "mwho",
			:users			=> [
				{
					:user_id 		=> 41545,
					:email 			=> "mavenlinkqa+automation@gmail.com",
					:password 		=> "password",
					:permission 	=> "account_admin",
					:workspace_id 	=> 69665
					
				},
				{
					:user_id 		=> 41555,
					:email 			=> "mavenlinkqa+auto.pc@gmail.com",
					:password 		=> "password",
					:permission 	=> "punch_clock",
					:workspace_id 	=> 69665
						
				},
				{
					:user_id 		=> 41585,
					:email 			=> "mavenlinkqa+auto.co@gmail.com",
					:password 		=> "password",
					:permission 	=> "collaborator",
					:workspace_id 	=> 69665
						
				},
				{
					:user_id 		=> 41595,
					:email 			=> "mavenlinkqa+auto.prc@gmail.com",
					:password 		=> "password",
					:permission 	=> "project_creator",
					:workspace_id 	=> 69665,
					:template_id	=> 823345	
				},
				{
					:user_id 		=> 41605,
					:email 			=> "mavenlinkqa+auto.prl@gmail.com",
					:password 		=> "password",
					:permission 	=> "project_lead",
					:workspace_id 	=> 69665,
					:template_id	=> 823355	
				}
			]
		},
		{ # this is an example/template
			:environment 	=> "production",
			:users			=> [
				{
					:user_id 		=> 00001,
					:email 			=> "email.goes.here@gmail.com",
					:password 		=> "password_goes_here",
					:permission 	=> "access_group_name_goes_here",
					:workspace_id 	=> 00001,
					:template_id	=> 000001 # if user has access to templates
				}
			]
		}
	]
	end

end