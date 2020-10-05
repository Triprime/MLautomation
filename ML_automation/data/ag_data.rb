class AGData

	# def self.ag_urls(user_id=0, workspace_id=0)
	# # [
	# 	{
	# 		:group_name		=> "punch_clock",
	# 		:group_id		=> 1,
	# 		:urls 			=>
	# 		[ 
	# 			{   
	# 				:url_id 		=> 	1,
	# 				:description	=>	"DASHBOARD > Your Dashboard", 
	# 				:url  			=>	"/users/#{user_id}/dashboard?tab=your-dashboard",
	# 				:locator_type 	=>	:css,
	# 				:locator 		=> 	".dashboard-tab"
	# 			},
	# 			{
	# 				:url_id			=>	2
	# 			}
	# 		]
	# 	}
	# # 	,
	# # 	{
	# # 		:group_name		=> "collaborate",
	# # 	}
	# # ]
	# end

	def self.ag_urls_array(user_id=0, workspace_id=0)
	[
		{
			:group_name		=> "punch_clock",
			:group_id		=> 1,
			:default_group 	=> true,
			:view_only		=> false,
			:participant 	=> "contributor",
			:urls 			=>
			[ 
				{   
					:url_id 		=> 	1,
					:description	=>	"DASHBOARD > Your Dashboard", 
					:url  			=>	"/users/#{user_id}/dashboard?tab=your-dashboard",
					:locator_type 	=>	:css,
					:locator 		=> 	".dashboard-tab"
				},
				{   
					:url_id 		=> 	2,
					:description	=>	"DASHBOARD > Activity Feed", 
					:url  			=>	"/users/#{user_id}/show_activity_feed",
					:locator_type 	=>	:css,
					:locator 		=> 	".events"
				},
				{   
					:url_id 		=> 	3,
					:description	=>	"DASHBOARD > Files", 
					:url  			=>	"/files",
					:locator_type 	=>	:id,
					:locator 		=> 	"files_wrapper"
				},
				{   
					:url_id 		=> 	4,
					:description	=>	"PROJECTS > All Projects | List (default view)", 
					:url  			=>	"/projects#?genreFilter=has_participation",
					:locator_type 	=>	:css,
					:locator 		=> 	".workspace-list-wrapper"
				},
				{   
					:url_id 		=> 	5,
					:description	=>	"PROJECTS > All Projects | Cards", 
					:url  			=>	"/users/#{user_id}/show_project_details",
					:locator_type 	=>	:id,
					:locator 		=> 	"next_two_weeks_wrapper"
				},
				{   
					:url_id 		=> 	6,
					:description	=>	"PROJECTS > All Projects | Gantt", 
					:url  			=>	"/gantt",
					:locator_type 	=>	:css,
					:locator 		=> 	".toggle-fullscreen-button"
				},
				{   
					:url_id 		=> 	7,
					:description	=>	"PROJECTS > All Projects | Groups", 
					:url  			=>	"/workspace_groups",
					:locator_type 	=>	:css,
					:locator 		=> 	".workspace-groups-list-table-region"
				},
				{   
					:url_id 		=> 	8,
					:description	=>	"PROJECTS > All Projects > Project | Activity (default tab)", 
					:url  			=>	"/workspaces/#{workspace_id}",
					:locator_type 	=>	:css,
					:locator 		=> 	".workspace-list-table-region"
				},
				{   
					:url_id 		=> 	9,
					:description	=>	"PROJECTS > All Projects > Project | Task Tracker", 
					:url  			=>	"/workspaces/#{workspace_id}/tracker/position",
					:locator_type 	=>	:css,
					:locator 		=> 	".tracker"
				},
				{   
					:url_id 		=> 	10,
					:description	=>	"PROJECTS > All Projects > Project | Gantt", 
					:url  			=>	"/workspaces/#{workspace_id}/gantt",
					:locator_type 	=>	:css,
					:locator 		=> 	".toggle-fullscreen-button"
				},
				{   
					:url_id 		=> 	11,
					:description	=>	"PROJECTS > All Projects > Project | Files", 
					:url  			=>	"/workspaces/#{workspace_id}/files",
					:locator_type 	=>	:css,
					:locator 		=> 	".files > div"
				},
				{   
					:url_id 		=> 	12,
					:description	=>	"TASKS > All Tasks", 
					:url  			=>	"/stories/upcoming?usingDefaultFilters=true&columnSet=Your+View&byStatus=not+started",
					:locator_type 	=>	:xpath,
					:locator 		=> 	"//*[text()='Your View']"
				},	
				{   
					:url_id 		=> 	13,
					:description	=>	"TASKS > Your Tasks", 
					:url  			=>	"/stories/upcoming?columnSet=Your+Tasks&usingDefaultFilters=true&with_assignees=#{user_id}&byStatus=not+started",
					:locator_type 	=>	:xpath,
					:locator 		=> 	"//*[text()='Your Tasks']"
				},	
				{   
					:url_id 		=> 	14,
					:description	=>	"TASKS > Your Followed Tasks", 
					:url  			=>	"/stories/upcoming?columnSet=Your+Followed+Tasks&usingDefaultFilters=true&with_followers=#{user_id}&byStatus=not+started",
					:locator_type 	=>	:xpath,
					:locator 		=> 	"//*[text()='Your Followed Tasks']"
				},	
				{   
					:url_id 		=> 	15,
					:description	=>	"TASKS > All Issues", 
					:url  			=>	"/stories/upcoming?columnSet=Issue+Tracking&usingDefaultFilters=true&storyTypes=issue&byStatus=not+started",
					:locator_type 	=>	:xpath,
					:locator 		=> 	"//*[text()='Issue Tracking']"
				},	
				{   
					:url_id 		=> 	16,
					:description	=>	"TASKS > Your Issues", 
					:url  			=>	"/stories/upcoming?columnSet=Your+Issues&usingDefaultFilters=true&storyTypes=issue&with_assignees=#{user_id}&byStatus=not+started",
					:locator_type 	=>	:xpath,
					:locator 		=> 	"//*[text()='Your Issues']"
				},	
				{   
					:url_id 		=> 	17,
					:description	=>	"TIME & EXPENSE  > Time Entries (requires membership in a project)", 
					:url  			=>	"/time_entries",
					:locator_type 	=>	:css,
					:locator 		=> 	".time-entry-history"
				},
				{   
					:url_id 		=> 	18,
					:description	=>	"TIME & EXPENSE  > Monthly (requires membership in a project)", 
					:url  			=>	"/time_entries?tab=monthly",
					:locator_type 	=>	:none,
					:locator 		=> 	""
				},
				{   
					:url_id 		=> 	19,
					:description	=>	"TIME & EXPENSE  > Schedule: Weekly (requires membership in a project)", 
					:url  			=>	"/time_entries?tab=schedule",
					:locator_type 	=>	:none,
					:locator 		=> 	""
				},
				{   
					:url_id 		=> 	20,
					:description	=>	"TIME & EXPENSE  > Expenses (requires membership in a project)", 
					:url  			=>	"/expenses#overview",
					:locator_type 	=>	:none,
					:locator 		=> 	""
				},
				{   
					:url_id 		=> 	21,
					:description	=>	"TIME & EXPENSE  > Expense Reports (requires membership in a project)", 
					:url  			=>	"/expenses#submissions",
					:locator_type 	=>	:none,
					:locator 		=> 	""
				},
				{   
					:url_id 		=> 	22,
					:description	=>	"TOP NAV: User Name Menu > Profile", 
					:url  			=>	"/profiles/#{user_id}",
					:locator_type 	=>	:none,
					:locator 		=> 	""
				},
				{   
					:url_id 		=> 	23,
					:description	=>	"TOP NAV: User Name Menu > Email Settings", 
					:url  			=>	"/settings/email",
					:locator_type 	=>	:none,
					:locator 		=> 	""
				},
				{   
					:url_id 		=> 	24,
					:description	=>	"TOP NAV: User Name Menu > Password & Authorizations", 
					:url  			=>	"/settings/password",
					:locator_type 	=>	:none,
					:locator 		=> 	""
				},
				{   
					:url_id 		=> 	25,
					:description	=>	"TOP NAV: User Name Menu > Google Apps", 
					:url  			=>	"/settings/google_apps",
					:locator_type 	=>	:none,
					:locator 		=> 	""
				},
				{   
					:url_id 		=> 	26,
					:description	=>	"TOP NAV: User Name Menu > Your Exports", 
					:url  			=>	"/settings/export",
					:locator_type 	=>	:none,
					:locator 		=> 	""
				}
			]
		},
		{
			:group_name		=> "collaborate",
			:group_id		=> 2,
			:urls 			=>
			[ 
				{   
					:url_id 		=> 	1,
				}
			]
		}
	]
	end


	# def self.punch_clock(user_id=0, workspace_id=0)
	# {
	# 	:group_id		=> 1,
	# 	:group_name		=> "punch_clock",
	# 	:default_group 	=> true,
	# 	:view_only		=> false,
	# 	:participant 	=> "contributor",
	# 	:urls 			=> [
	# 		{   
	# 			:url_id 		=> 	1,
	# 			:description	=>	"DASHBOARD > Your Dashboard", 
	# 			:url  			=>	"/users/#{user_id}/dashboard?tab=your-dashboard",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".dashboard-tab"
	# 		},
	# 		{   
	# 			:url_id 		=> 	2,
	# 			:description	=>	"DASHBOARD > Activity Feed", 
	# 			:url  			=>	"/users/#{user_id}/show_activity_feed",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".events"
	# 		},
	# 		{   
	# 			:url_id 		=> 	3,
	# 			:description	=>	"DASHBOARD > Files", 
	# 			:url  			=>	"/files",
	# 			:locator_type 	=>	:id,
	# 			:locator 		=> 	"files_wrapper"
	# 		},
	# 		{   
	# 			:url_id 		=> 	4,
	# 			:description	=>	"PROJECTS > All Projects | List (default view)", 
	# 			:url  			=>	"/projects#?genreFilter=has_participation",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".workspace-list-wrapper"
	# 		},
	# 		{   
	# 			:url_id 		=> 	5,
	# 			:description	=>	"PROJECTS > All Projects | Cards", 
	# 			:url  			=>	"/users/#{user_id}/show_project_details",
	# 			:locator_type 	=>	:id,
	# 			:locator 		=> 	"next_two_weeks_wrapper"
	# 		},
	# 		{   
	# 			:url_id 		=> 	6,
	# 			:description	=>	"PROJECTS > All Projects | Gantt", 
	# 			:url  			=>	"/gantt",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".toggle-fullscreen-button"
	# 		},
	# 		{   
	# 			:url_id 		=> 	7,
	# 			:description	=>	"PROJECTS > All Projects | Groups", 
	# 			:url  			=>	"/workspace_groups",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".workspace-groups-list-table-region"
	# 		},
	# 		{   
	# 			:url_id 		=> 	8,
	# 			:description	=>	"PROJECTS > All Projects > Project | Activity (default tab)", 
	# 			:url  			=>	"/workspaces/#{workspace_id}",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".workspace-list-table-region"
	# 		},
	# 		{   
	# 			:url_id 		=> 	9,
	# 			:description	=>	"PROJECTS > All Projects > Project | Task Tracker", 
	# 			:url  			=>	"/workspaces/#{workspace_id}/tracker/position",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".tracker"
	# 		},
	# 		{   
	# 			:url_id 		=> 	10,
	# 			:description	=>	"PROJECTS > All Projects > Project | Gantt", 
	# 			:url  			=>	"/workspaces/#{workspace_id}/gantt",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".toggle-fullscreen-button"
	# 		},
	# 		{   
	# 			:url_id 		=> 	11,
	# 			:description	=>	"PROJECTS > All Projects > Project | Files", 
	# 			:url  			=>	"/workspaces/#{workspace_id}/files",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".files > div"
	# 		},
	# 		{   
	# 			:url_id 		=> 	12,
	# 			:description	=>	"TASKS > All Tasks", 
	# 			:url  			=>	"/stories/upcoming?usingDefaultFilters=true&columnSet=Your+View&byStatus=not+started",
	# 			:locator_type 	=>	:xpath,
	# 			:locator 		=> 	"//*[text()='Your View']"
	# 		},	
	# 		{   
	# 			:url_id 		=> 	13,
	# 			:description	=>	"TASKS > Your Tasks", 
	# 			:url  			=>	"/stories/upcoming?columnSet=Your+Tasks&usingDefaultFilters=true&with_assignees=#{user_id}&byStatus=not+started",
	# 			:locator_type 	=>	:xpath,
	# 			:locator 		=> 	"//*[text()='Your Tasks']"
	# 		},	
	# 		{   
	# 			:url_id 		=> 	14,
	# 			:description	=>	"TASKS > Your Followed Tasks", 
	# 			:url  			=>	"/stories/upcoming?columnSet=Your+Followed+Tasks&usingDefaultFilters=true&with_followers=#{user_id}&byStatus=not+started",
	# 			:locator_type 	=>	:xpath,
	# 			:locator 		=> 	"//*[text()='Your Followed Tasks']"
	# 		},	
	# 		{   
	# 			:url_id 		=> 	15,
	# 			:description	=>	"TASKS > All Issues", 
	# 			:url  			=>	"/stories/upcoming?columnSet=Issue+Tracking&usingDefaultFilters=true&storyTypes=issue&byStatus=not+started",
	# 			:locator_type 	=>	:xpath,
	# 			:locator 		=> 	"//*[text()='Issue Tracking']"
	# 		},	
	# 		{   
	# 			:url_id 		=> 	16,
	# 			:description	=>	"TASKS > Your Issues", 
	# 			:url  			=>	"/stories/upcoming?columnSet=Your+Issues&usingDefaultFilters=true&storyTypes=issue&with_assignees=#{user_id}&byStatus=not+started",
	# 			:locator_type 	=>	:xpath,
	# 			:locator 		=> 	"//*[text()='Your Issues']"
	# 		},	
	# 		{   
	# 			:url_id 		=> 	17,
	# 			:description	=>	"TIME & EXPENSE  > Time Entries (requires membership in a project)", 
	# 			:url  			=>	"/time_entries",
	# 			:locator_type 	=>	:css,
	# 			:locator 		=> 	".time-entry-history"
	# 		},
	# 		{   
	# 			:url_id 		=> 	18,
	# 			:description	=>	"TIME & EXPENSE  > Monthly (requires membership in a project)", 
	# 			:url  			=>	"/time_entries?tab=monthly",
	# 			:locator_type 	=>	:none,
	# 			:locator 		=> 	""
	# 		},
	# 		{   
	# 			:url_id 		=> 	19,
	# 			:description	=>	"TIME & EXPENSE  > Schedule: Weekly (requires membership in a project)", 
	# 			:url  			=>	"/time_entries?tab=schedule",
	# 			:locator_type 	=>	:none,
	# 			:locator 		=> 	""
	# 		},
	# 		{   
	# 			:url_id 		=> 	20,
	# 			:description	=>	"TIME & EXPENSE  > Expenses (requires membership in a project)", 
	# 			:url  			=>	"/expenses#overview",
	# 			:locator_type 	=>	:none,
	# 			:locator 		=> 	""
	# 		},
	# 		{   
	# 			:url_id 		=> 	21,
	# 			:description	=>	"TIME & EXPENSE  > Expense Reports (requires membership in a project)", 
	# 			:url  			=>	"/expenses#submissions",
	# 			:locator_type 	=>	:none,
	# 			:locator 		=> 	""
	# 		},
	# 		{   
	# 			:url_id 		=> 	22,
	# 			:description	=>	"TOP NAV: User Name Menu > Profile", 
	# 			:url  			=>	"/profiles/#{user_id}",
	# 			:locator_type 	=>	:none,
	# 			:locator 		=> 	""
	# 		},
	# 		{   
	# 			:url_id 		=> 	23,
	# 			:description	=>	"TOP NAV: User Name Menu > Email Settings", 
	# 			:url  			=>	"/settings/email",
	# 			:locator_type 	=>	:none,
	# 			:locator 		=> 	""
	# 		},
	# 		{   
	# 			:url_id 		=> 	24,
	# 			:description	=>	"TOP NAV: User Name Menu > Password & Authorizations", 
	# 			:url  			=>	"/settings/password",
	# 			:locator_type 	=>	:none,
	# 			:locator 		=> 	""
	# 		},
	# 		{   
	# 			:url_id 		=> 	25,
	# 			:description	=>	"TOP NAV: User Name Menu > Google Apps", 
	# 			:url  			=>	"/settings/google_apps",
	# 			:locator_type 	=>	:none,
	# 			:locator 		=> 	""
	# 		},
	# 		{   
	# 			:url_id 		=> 	26,
	# 			:description	=>	"TOP NAV: User Name Menu > Your Exports", 
	# 			:url  			=>	"/settings/export",
	# 			:locator_type 	=>	:none,
	# 			:locator 		=> 	""
	# 		}
	# 	]	

	# }

	# end
end