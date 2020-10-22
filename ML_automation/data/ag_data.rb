class AGData

	def self.ag_urls_array(user_id=0, workspace_id=0)
	[
		{
			:group_name		=> "punch_clock",
			# :group_id		=> 1,
			# :default_group 	=> true,
			# :view_only		=> false,
			# :participant 	=> "contributor",
			:urls 			=>
			[ 
				{   
					:description	=>	"DASHBOARD > Your Dashboard", 
					:url  			=>	"/users/#{user_id}/dashboard?tab=your-dashboard"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".dashboard-tab"
				},
				{   
					:description	=>	"DASHBOARD > Activity Feed", 
					:url  			=>	"/users/#{user_id}/show_activity_feed"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".events"
				},
				{   
					:description	=>	"DASHBOARD > Files", 
					:url  			=>	"/files"
					# :locator_type 	=>	:id,
					# :locator 		=> 	"files_wrapper"
				},
				{   
					:description	=>	"PROJECTS > All Projects | List (default view)", 
					:url  			=>	"/projects#?genreFilter=has_participation"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".workspace-list-wrapper"
				},
				{   
					:description	=>	"PROJECTS > All Projects | Cards", 
					:url  			=>	"/users/#{user_id}/show_project_details"
					# :locator_type 	=>	:id,
					# :locator 		=> 	"next_two_weeks_wrapper"
				},
				{   
					:description	=>	"PROJECTS > All Projects | Gantt", 
					:url  			=>	"/gantt"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".toggle-fullscreen-button"
				},
				{   
					:description	=>	"PROJECTS > All Projects | Groups", 
					:url  			=>	"/workspace_groups"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".workspace-groups-list-table-region"
				},
				{   
					:description	=>	"PROJECTS > All Projects > Project | Activity (default tab)", 
					:url  			=>	"/workspaces/#{workspace_id}"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".workspace-list-table-region"
				},
				{   
					:description	=>	"PROJECTS > All Projects > Project | Task Tracker", 
					:url  			=>	"/workspaces/#{workspace_id}/tracker/position"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".tracker"
				},
				{   
					:description	=>	"PROJECTS > All Projects > Project | Gantt", 
					:url  			=>	"/workspaces/#{workspace_id}/gantt"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".toggle-fullscreen-button"
				},
				{   
					:description	=>	"PROJECTS > All Projects > Project | Files", 
					:url  			=>	"/workspaces/#{workspace_id}/files"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".files > div"
				},
				{   
					:description	=>	"TASKS > All Tasks", 
					:url  			=>	"/stories/upcoming?usingDefaultFilters=true&columnSet=Your+View&byStatus=not+started"
					# :locator_type 	=>	:xpath,
					# :locator 		=> 	"//*[text()='Your View']"
				},	
				{   
					:description	=>	"TASKS > Your Tasks", 
					:url  			=>	"/stories/upcoming?columnSet=Your+Tasks&usingDefaultFilters=true&with_assignees=#{user_id}&byStatus=not+started"
					# :locator_type 	=>	:xpath,
					# :locator 		=> 	"//*[text()='Your Tasks']"
				},	
				{   
					:description	=>	"TASKS > Your Followed Tasks", 
					:url  			=>	"/stories/upcoming?columnSet=Your+Followed+Tasks&usingDefaultFilters=true&with_followers=#{user_id}&byStatus=not+started"
					# :locator_type 	=>	:xpath,
					# :locator 		=> 	"//*[text()='Your Followed Tasks']"
				},	
				{   
					:description	=>	"TASKS > All Issues", 
					:url  			=>	"/stories/upcoming?columnSet=Issue+Tracking&usingDefaultFilters=true&storyTypes=issue&byStatus=not+started"
					# :locator_type 	=>	:xpath,
					# :locator 		=> 	"//*[text()='Issue Tracking']"
				},	
				{   
					:description	=>	"TASKS > Your Issues", 
					:url  			=>	"/stories/upcoming?columnSet=Your+Issues&usingDefaultFilters=true&storyTypes=issue&with_assignees=#{user_id}&byStatus=not+started"
					# :locator_type 	=>	:xpath,
					# :locator 		=> 	"//*[text()='Your Issues']"
				},	
				{   
					:description	=>	"TIME & EXPENSE  > Time Entries (requires membership in a project)", 
					:url  			=>	"/time_entries"
					# :locator_type 	=>	:css,
					# :locator 		=> 	".time-entry-history"
				},
				{   
					:description	=>	"TIME & EXPENSE  > Monthly (requires membership in a project)", 
					:url  			=>	"/time_entries?tab=monthly"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"TIME & EXPENSE  > Schedule: Weekly (requires membership in a project)", 
					:url  			=>	"/time_entries?tab=schedule"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"TIME & EXPENSE  > Expenses (requires membership in a project)", 
					:url  			=>	"/expenses#overview"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"TIME & EXPENSE  > Expense Reports (requires membership in a project)", 
					:url  			=>	"/expenses#submissions"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"TOP NAV: User Name Menu > Profile", 
					:url  			=>	"/profiles/#{user_id}"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"TOP NAV: User Name Menu > Email Settings", 
					:url  			=>	"/settings/email"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"TOP NAV: User Name Menu > Password & Authorizations", 
					:url  			=>	"/settings/password"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"TOP NAV: User Name Menu > Google Apps", 
					:url  			=>	"/settings/google_apps"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"TOP NAV: User Name Menu > Your Exports", 
					:url  			=>	"/settings/export"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"BILLING > Invoices (should not have permission)", 
					:url  			=>	"/invoices"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				},
				{   
					:description	=>	"BILLING > Invoices (should 404 - incorrect url)", 
					:url  			=>	"/invoicess"
					# :locator_type 	=>	:none,
					# :locator 		=> 	""
				}
			]
		},
		{
			:group_name		=> "collaborate",
			:group_id		=> 2,
			:urls 			=>
			[ 
				{   
					:description	=>	"description goes here", 
					:url  			=>	"url goes here"
				}
			]
		}
	]
	end

end