class PageData
	# @user_id = TestData.get_user_fixtures["fixture_1"]["user_id"] 	# Account Admin
	# @user_id = TestData.get_user_fixtures["fixture_2"]["user_id"]	# Permissions QA account member


	# Dashboard
	def self.your_dashboard
		{
			:page_title				=>	"Your Dashboard",
			:page_url				=>	"/users/#{@user_id}/dashboard",
			:main_menu_locator		=>	".link:nth-child(2) > .outer-link > .nav-link-text",
			:main_menu_locator_type	=>	:css,
			:sub_nav_locator		=>	".dashboard_your-dashboard .nav-link-text",
			:sub_nav_locator_type	=>	:css
		}
	end

	def self.activity_feed
		{
			:page_title				=>	"Activity Feed",
			:page_url				=>	"/users/#{@user_id}/show_activity_feed",
			:main_menu_locator		=>	".link:nth-child(2) > .outer-link > .nav-link-text",
			:main_menu_locator_type	=>	:css,
			:sub_nav_locator		=>	".dashboard_events .nav-link-text",
			:sub_nav_locator_type	=>	:css
		}
	end

	def self.files
		{
			:page_title				=>	"Files",
			:page_url				=>	"/files",
			:main_menu_locator		=>	".link:nth-child(2) > .outer-link > .nav-link-text",
			:main_menu_locator_type	=>	:css,
			:sub_nav_locator		=>	".dashboard_files .nav-link-text",
			:sub_nav_locator_type	=>	:css
		}
	end


	# Projects
	def self.projects
		{
			:page_title				=>	"Projects",
			:page_url				=>	"/projects",
			:main_menu_locator		=>	".link:nth-child(3) > .outer-link > .nav-link-text",
			:main_menu_locator_type	=>	:css,
			:sub_nav_locator		=>	".all-projects > .nav-link-text",
			:sub_nav_locator_type	=>	:css
		}
	end


	# Templates
	def self.templates
		{
			:page_title				=>	"Project Templates",
			:page_url				=>	"/project_templates",
			:main_menu_locator		=>	".link:nth-child(4) > .outer-link > .nav-link-text",
			:main_menu_locator_type	=>	:css,
			:sub_nav_locator		=>	"",
			:sub_nav_locator_type	=>	:css
		}
	end


	# Tasks
	def self.tasks
		{
			:page_title				=>	"Tasks",
			:page_url				=>	"/stories",
			:main_menu_locator		=>	".link:nth-child(5) > .outer-link > .nav-link-text",
			:main_menu_locator_type	=>	:css,
			:sub_nav_locator		=>	"",
			:sub_nav_locator_type	=>	:css
		}
	end


	# Settings
	def self.settings
		{
			:page_title				=>	"General Settings",
			:page_url				=>	"/settings/account/general",
			:main_menu_locator		=>	".link:nth-child(6) > .outer-link > .nav-link-text",
			:main_menu_locator_type	=>	:css,
			:sub_nav_locator		=>	"",
			:sub_nav_locator_type	=>	:css
		}
	end

	def self.unique_elements(user_id=0, workspace_id=0)
		[
		# DASHBOARD 
			# Your Dashboard
			["/users/#{user_id}/dashboard?tab=your-dashboard",
				:css,".dashboard-tab"],
			# Activity Feed	
			["/users/#{user_id}/show_activity_feed",				
				:css,".events"],
			# Files
			["/files",											
				:id,"files_wrapper"],

		# PROJECTS
			# Project List > Index (default view)
			["/projects#?genreFilter=has_participation",
				:css,".workspace-list-wrapper"],
			# Project List > Cards 		
			["/users/#{user_id}/show_project_details",
				:id,"next_two_weeks_wrapper"],
			# Project List > Gantt			
			["/gantt",
				:css,".toggle-fullscreen-button"],
			# Project List > Groups											
			["/workspace_groups",
				:css,".workspace-groups-list-table-region"],
			# > Project > Activity (default view)								
			["/workspaces/#{workspace_id}",
				:css,".post-form"],
				# :css,".main-post-form-container"],
				# :css,".workspace-list-table-region"],
			# > Project > Task Tracker						
			["/workspaces/#{workspace_id}/tracker/position",
				:css,".tracker"],
			# > Project > Gantt 	
			["/workspaces/#{workspace_id}/gantt",				
				:css,".toggle-fullscreen-button"],
			# Select Project > Files
			["/workspaces/#{workspace_id}/files",
				:css,".files > div"],		

		# TASKS
			# All Tasks
			["/stories/upcoming?usingDefaultFilters=true&columnSet=Your+View&byStatus=not+started",
				:xpath,"//*[text()='Your View']"],
			# Your Tasks	
			["/stories/upcoming?columnSet=Your+Tasks&usingDefaultFilters=true&with_assignees=#{user_id}&byStatus=not+started",
				:xpath,"//*[text()='Your Tasks']"],
			# Your Followed Tasks
			["/stories/upcoming?columnSet=Your+Followed+Tasks&usingDefaultFilters=true&with_followers=#{user_id}&byStatus=not+started",
				:xpath,"//*[text()='Your Followed Tasks']"],
			# All Issues
			["/stories/upcoming?columnSet=Issue+Tracking&usingDefaultFilters=true&storyTypes=issue&byStatus=not+started",
				:xpath,"//*[text()='Issue Tracking']"],
			# Your Issues
			["/stories/upcoming?columnSet=Your+Issues&usingDefaultFilters=true&storyTypes=issue&with_assignees=#{user_id}&byStatus=not+started",
				:xpath,"//*[text()='Your Issues']"],


		# TIME & EXPENSE 
			# Time Entries (requires membership in a project)	
			["/time_entries",
				:css,".time-entry-history"]
		
		]

	end

	def self.permissions_data(user_id=0, workspace_id=0)
	{
		:punch_clock => [
			{   
				:id 			=> 	1,
				:description	=>	"DASHBOARD > Your Dashboard", 
				:url  			=>	"/users/#{user_id}/dashboard?tab=your-dashboard",
				:locator_type 	=>	:css,
				:locator 		=> 	".dashboard-tab"
			},
			{   
				:id 			=> 	2,
				:description	=>	"DASHBOARD > Activity Feed", 
				:url  			=>	"/users/#{user_id}/show_activity_feed",
				:locator_type 	=>	:css,
				:locator 		=> 	".events"
			},
			{   
				:id 			=> 	3,
				:description	=>	"DASHBOARD > Files", 
				:url  			=>	"/files",
				:locator_type 	=>	:id,
				:locator 		=> 	"files_wrapper"
			},
			{   
				:id 			=> 	4,
				:description	=>	"PROJECTS > All Projects | List (default view)", 
				:url  			=>	"/projects#?genreFilter=has_participation",
				:locator_type 	=>	:css,
				:locator 		=> 	".workspace-list-wrapper"
			},
			{   
				:id 			=> 	5,
				:description	=>	"PROJECTS > All Projects | Cards", 
				:url  			=>	"/users/#{user_id}/show_project_details",
				:locator_type 	=>	:id,
				:locator 		=> 	"next_two_weeks_wrapper"
			},
			{   
				:id 			=> 	6,
				:description	=>	"PROJECTS > All Projects | Gantt", 
				:url  			=>	"/gantt",
				:locator_type 	=>	:css,
				:locator 		=> 	".toggle-fullscreen-button"
			},
			{   
				:id 			=> 	7,
				:description	=>	"PROJECTS > All Projects | Groups", 
				:url  			=>	"/workspace_groups",
				:locator_type 	=>	:css,
				:locator 		=> 	".workspace-groups-list-table-region"
			},
			{   
				:id 			=> 	8,
				:description	=>	"PROJECTS > All Projects > Project | Activity (default tab)", 
				:url  			=>	"/workspaces/#{workspace_id}",
				:locator_type 	=>	:css,
				:locator 		=> 	".workspace-list-table-region"
			},
			{   
				:id 			=> 	9,
				:description	=>	"PROJECTS > All Projects > Project | Task Tracker", 
				:url  			=>	"/workspaces/#{workspace_id}/tracker/position",
				:locator_type 	=>	:css,
				:locator 		=> 	".tracker"
			},
			{   
				:id 			=> 	10,
				:description	=>	"PROJECTS > All Projects > Project | Gantt", 
				:url  			=>	"/workspaces/#{workspace_id}/gantt",
				:locator_type 	=>	:css,
				:locator 		=> 	".toggle-fullscreen-button"
			},
			{   
				:id 			=> 	11,
				:description	=>	"PROJECTS > All Projects > Project | Files", 
				:url  			=>	"/workspaces/#{workspace_id}/files",
				:locator_type 	=>	:css,
				:locator 		=> 	".files > div"
			},
			{   
				:id 			=> 	12,
				:description	=>	"TASKS > All Tasks", 
				:url  			=>	"/stories/upcoming?usingDefaultFilters=true&columnSet=Your+View&byStatus=not+started",
				:locator_type 	=>	:xpath,
				:locator 		=> 	"//*[text()='Your View']"
			},	
			{   
				:id 			=> 	13,
				:description	=>	"TASKS > Your Tasks", 
				:url  			=>	"/stories/upcoming?columnSet=Your+Tasks&usingDefaultFilters=true&with_assignees=#{user_id}&byStatus=not+started",
				:locator_type 	=>	:xpath,
				:locator 		=> 	"//*[text()='Your Tasks']"
			},	
			{   
				:id 			=> 	14,
				:description	=>	"TASKS > Your Followed Tasks", 
				:url  			=>	"/stories/upcoming?columnSet=Your+Followed+Tasks&usingDefaultFilters=true&with_followers=#{user_id}&byStatus=not+started",
				:locator_type 	=>	:xpath,
				:locator 		=> 	"//*[text()='Your Followed Tasks']"
			},	
			{   
				:id 			=> 	15,
				:description	=>	"TASKS > All Issues", 
				:url  			=>	"/stories/upcoming?columnSet=Issue+Tracking&usingDefaultFilters=true&storyTypes=issue&byStatus=not+started",
				:locator_type 	=>	:xpath,
				:locator 		=> 	"//*[text()='Issue Tracking']"
			},	
			{   
				:id 			=> 	16,
				:description	=>	"TASKS > Your Issues", 
				:url  			=>	"/stories/upcoming?columnSet=Your+Issues&usingDefaultFilters=true&storyTypes=issue&with_assignees=#{user_id}&byStatus=not+started",
				:locator_type 	=>	:xpath,
				:locator 		=> 	"//*[text()='Your Issues']"
			},	
			{   
				:id 			=> 	17,
				:description	=>	"TIME & EXPENSE  > Time Entries (requires membership in a project)", 
				:url  			=>	"/time_entries",
				:locator_type 	=>	:css,
				:locator 		=> 	".time-entry-history"
			},
			{   
				:id 			=> 	18,
				:description	=>	"TIME & EXPENSE  > Monthly (requires membership in a project)", 
				:url  			=>	"/time_entries?tab=monthly",
				:locator_type 	=>	:none,
				:locator 		=> 	""
			},
			{   
				:id 			=> 	19,
				:description	=>	"TIME & EXPENSE  > Schedule: Weekly (requires membership in a project)", 
				:url  			=>	"/time_entries?tab=schedule",
				:locator_type 	=>	:none,
				:locator 		=> 	""
			},
			{   
				:id 			=> 	20,
				:description	=>	"TIME & EXPENSE  > Expenses (requires membership in a project)", 
				:url  			=>	"/expenses#overview",
				:locator_type 	=>	:none,
				:locator 		=> 	""
			},
			{   
				:id 			=> 	21,
				:description	=>	"TIME & EXPENSE  > Expense Reports (requires membership in a project)", 
				:url  			=>	"/expenses#submissions",
				:locator_type 	=>	:none,
				:locator 		=> 	""
			},
			{   
				:id 			=> 	22,
				:description	=>	"TOP NAV: User Name Menu > Profile", 
				:url  			=>	"/profiles/#{user_id}",
				:locator_type 	=>	:none,
				:locator 		=> 	""
			},
			{   
				:id 			=> 	23,
				:description	=>	"TOP NAV: User Name Menu > Email Settings", 
				:url  			=>	"/settings/email",
				:locator_type 	=>	:none,
				:locator 		=> 	""
			},
			{   
				:id 			=> 	24,
				:description	=>	"TOP NAV: User Name Menu > Password & Authorizations", 
				:url  			=>	"/settings/password",
				:locator_type 	=>	:none,
				:locator 		=> 	""
			},
			{   
				:id 			=> 	25,
				:description	=>	"TOP NAV: User Name Menu > Google Apps", 
				:url  			=>	"/settings/google_apps",
				:locator_type 	=>	:none,
				:locator 		=> 	""
			},
			{   
				:id 			=> 	26,
				:description	=>	"TOP NAV: User Name Menu > Your Exports", 
				:url  			=>	"/settings/export",
				:locator_type 	=>	:none,
				:locator 		=> 	""
			}
		]	

	}
	end

end