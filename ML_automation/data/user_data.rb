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
					:permission 	=> "admin",
					:workspace_id 	=> 69665,
					:template_id	=> 823385,
					:exchange_table_id => 145,
					:rate_card_id 	=> 4095		
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
				},
				{
					:user_id 		=> 41615,
					:email 			=> "mavenlinkqa+auto.rv@gmail.com",
					:password 		=> "password",
					:permission 	=> "report_viewer",
					:workspace_id 	=> 69665,
					:template_id	=> 823365	
				},
				{
					:user_id 		=> 41625,
					:email 			=> "mavenlinkqa+auto.rvc@gmail.com",
					:password 		=> "password",
					:permission 	=> "report_viewer_with_cost",
					:workspace_id 	=> 69665,
					:template_id	=> 823375	
				}
			]
		},
		{
			:environment 	=> "railsnext",
			:users			=> [
				{
					:user_id 		=> 19975,
					:email 			=> "mavenlinkqa+automation@gmail.com",
					:password 		=> "password",
					:permission 	=> "admin",
					:workspace_id 	=> 325,
					:template_id	=> 45,
					# :exchange_table_id => 145,
					:rate_card_id 	=> 5	
				},
				{
					:user_id 		=> 20035,
					:email 			=> "mavenlinkqa+auto.pc@gmail.com",
					:password 		=> "password",
					:permission 	=> "punch_clock",
					:workspace_id 	=> 325
				},
				{
					:user_id 		=> 20025,
					:email 			=> "mavenlinkqa+auto.co@gmail.com",
					:password 		=> "password",
					:permission 	=> "collaborator",
					:workspace_id 	=> 325
						
				},
				{
					:user_id 		=> 20015,
					:email 			=> "mavenlinkqa+auto.prc@gmail.com",
					:password 		=> "password",
					:permission 	=> "project_creator",
					:workspace_id 	=> 325,
					:template_id	=> 85	
				},
				{
					:user_id 		=> 20005,
					:email 			=> "mavenlinkqa+auto.prl@gmail.com",
					:password 		=> "password",
					:permission 	=> "project_lead",
					:workspace_id 	=> 325,
					:template_id	=> 75	
				},
				{
					:user_id 		=> 19995,
					:email 			=> "mavenlinkqa+auto.rv@gmail.com",
					:password 		=> "password",
					:permission 	=> "report_viewer",
					:workspace_id 	=> 325,
					:template_id	=> 65	
				},
				{
					:user_id 		=> 19985,
					:email 			=> "mavenlinkqa+auto.rvc@gmail.com",
					:password 		=> "password",
					:permission 	=> "report_viewer_with_cost",
					:workspace_id 	=> 325,
					:template_id	=> 55	
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