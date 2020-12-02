class AGData

	def self.ag_urls_array(user_id=0, workspace_id=0)
	[
		{
			:group_name		=> "punch_clock",
			# :default_group 	=> true,
			# :view_only		=> false,
			# :project 			=> "contributor",
			# :plans			=>	["premier","pro","teams","free"],
			:included_url_groups => [],
			:urls 			=>
			[
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
					:description	=>	"DASHBOARD > Your Dashboard", 
					:url  			=>	"/users/#{user_id}/dashboard?tab=your-dashboard",
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
					:description	=>	"TASKS > All Tasks v Info", 
					:url  			=>	"/stories/upcoming?usingDefaultFilters=true&columnSet=Info&byStatus=not+started%2Cstarted%2Cneeds+info%2Cnew%2Creopened%2Cin+progress%2Cblocked%2Cfixed%2Cduplicate%2Ccan%27t+repro%2Cresolved%2Cwon%27t+fix&archived=exclude"
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
				}
				# ,{   
				# 	:description	=>	"BILLING > Invoices (should 404 - incorrect url)", 
				# 	:url  			=>	"/invoicess"
				# 	# :locator_type 	=>	:none,
				# 	# :locator 		=> 	""
				# }
			]
		},
		{
			:group_name		=> "collaborator",
			:included_url_groups => ["punch_clock"],
			:urls 			=>
			[
				{
					:description	=>	"PROJECTS > All Projects > Project | Time & Expenses", 
					:url  			=>	"/workspaces/#{workspace_id}/?tab=time-tracking"
				}
			]
		},
		{ 
			:group_name		=> "project_creator",
			:included_url_groups => ["punch_clock","collaborator"],
			:urls 			=>
			[
				{   
					:description	=>	"PROJECTS > New Project", 
					:url  			=>	"/workspaces/new"
				},
				{   
					:description	=>	"TEMPLATES > All Templates", 
					:url  			=>	"/project_templates"
				},
				{   
					:description	=>	"TEMPLATES > All Templates > New Template", 
					:url  			=>	"/project_templates#new"
				}
			]
		},
		{ 
			:group_name		=> "project_lead",
			:included_url_groups => ["punch_clock","collaborator","project_creator"],
			:urls 			=>
			[
				{   
					:description	=>	"TASKS > All Tasks v Progress", 
					:url  			=>	"/stories/upcoming?usingDefaultFilters=true&columnSet=Progress&byStatus=not+started%2Cstarted%2Cneeds+info%2Cnew%2Creopened%2Cin+progress%2Cblocked%2Cfixed%2Cduplicate%2Ccan't+repro%2Cresolved%2Cwon't+fix&archived=exclude"
				},
				{   
					:description	=>	"TASKS > All Tasks v Financial", 
					:url  			=>	"/stories/upcoming?usingDefaultFilters=true&columnSet=Financial&byStatus=not+started%2Cstarted%2Cneeds+info%2Cnew%2Creopened%2Cin+progress%2Cblocked%2Cfixed%2Cduplicate%2Ccan%27t+repro%2Cresolved%2Cwon%27t+fix&archived=exclude"
				},
				{   
					:description	=>	"TASKS > All Tasks v Resource", 
					:url  			=>	"/stories/upcoming?usingDefaultFilters=true&columnSet=Resource&archived=exclude"
				},
				{   
					:description	=>	"TIME & EXPENSE > Time Approvals | Submitted", 
					:url  			=>	"/time_entries?tab=time+approvals#personnel/submitted?startDate=#{Time.now.strftime("%Y-%m-%d")}&endDate=#{Time.now.strftime("%Y-%m-%d")}&yourProjects=true"
				},
				{   
					:description	=>	"TIME & EXPENSE > Time Approvals | Unsubmitted", 
					:url  			=>	"/time_entries?tab=time+approvals#personnel/unsubmitted?startDate=#{Time.now.strftime("%Y-%m-%d")}&endDate=#{Time.now.strftime("%Y-%m-%d")}&yourProjects=true"
				},
				{   
					:description	=>	"TIME & EXPENSE > Time Approvals | Rejected", 
					:url  			=>	"/time_entries?tab=time+approvals#personnel/rejected?startDate=#{Time.now.strftime("%Y-%m-%d")}&endDate=#{Time.now.strftime("%Y-%m-%d")}&yourProjects=true"
				},
				{   
					:description	=>	"BILLING > Invoices", 
					:url  			=>	"/invoices"
				},
				{   
					:description	=>	"BILLING > Invoices | Create across projects by client", 
					:url  			=>	"/invoices/multi_projects?create=true"
				}
			]
		},
		{ 
			:group_name		=> "report_viewer",
			:included_url_groups => ["punch_clock","collaborator","project_creator","project_lead"],
			:urls 			=> []
		},
		{ 
			:group_name		=> "report_viewer_with_cost",
			:included_url_groups => ["punch_clock","collaborator","project_creator","project_lead","report_viewer"],
			:urls 			=> []
		},
		{ 
			:group_name		=> "admin",
			:included_url_groups => ["punch_clock","collaborator","project_creator","project_lead","report_viewer","report_viewer_with_cost"],
			:urls 			=> []
		},
		{ # this is a template for how to set up urls for a specific access group 
			:group_name		=> "access_group_name_goes_here",
			:included_url_groups => [],
			:urls 			=>
			[
				{   
					:description	=>	"description goes here - describe how a user would nav to this url", 
					:url  			=>	"url goes here"
				},
				{   
					:description	=>	"MAIN NAV > Sub-nav > View | Tab", 
					:url  			=>	"url endpoint only"
				}
			]
		}
	]
	end

end