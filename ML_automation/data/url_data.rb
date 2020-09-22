class UrlData

	def self.punch_clock_temp(user_id=2,workspace_id=2)
		[
			# Small sample for quick testing
			"/users/#{user_id}/dashboard?tab=your-dashboard",	# DASHBOARD > Your Dashboard
			"/workspaces/#{workspace_id}/files",				# PROJECTS > Select Project > Files
			"/time_entries"										# TIME & EXPENSE > Time Entries (requires membership in a project)
		]
	end

	def self.punch_clock(user_id=2,workspace_id=2)
		[
			# DASHBOARD
			"/users/#{user_id}/dashboard?tab=your-dashboard",	# Your Dashboard
			"/users/#{user_id}/show_activity_feed",				# Activity Feed
			"/files",											# Files

			# PROJECTS
			"/projects#?genreFilter=has_participation", 		# Project List > Index
			"/users/#{user_id}/show_project_details",			# Project List > Cards
			"/gantt",											# Project List > Gantt
			"/workspace_groups",								# > Groups
			"/workspaces/#{workspace_id}",						# > Project > Activity (default view)
			"/workspaces/#{workspace_id}/tracker/position", 	# > Project > Task Tracker
			"/workspaces/#{workspace_id}/gantt",				# > Project > Gantt
			"/workspaces/#{workspace_id}/files",				# > Project > Files

			# TASKS
			"/stories/upcoming?usingDefaultFilters=true&columnSet=Your+View&byStatus=not+started",
			"/stories/upcoming?columnSet=Your+Tasks&usingDefaultFilters=true&with_assignees=#{user_id}&byStatus=not+started",
			"/stories/upcoming?columnSet=Your+Followed+Tasks&usingDefaultFilters=true&with_followers=#{user_id}&byStatus=not+started",
			"/stories/upcoming?columnSet=Issue+Tracking&usingDefaultFilters=true&storyTypes=issue&byStatus=not+started",
			"/stories/upcoming?columnSet=Your+Issues&usingDefaultFilters=true&storyTypes=issue&with_assignees=#{user_id}&byStatus=not+started",

			# TIME & EXPENSE
			"/time_entries",									# Time Entries (requires membership in a project)
			"/time_entries?tab=monthly",						# (requires time entry in project)
			"/time_entries?tab=schedule",						# (requires time entry in project)
			"/expenses#overview",								# (requires time entry in project)
			"/expenses#submissions",							# (requires time entry in project)

			# TOP NAV: User Name Menu
			"/profiles/#{user_id}",
			"/settings/email",
			"/settings/password",
			"/settings/google_apps",
			"/settings/export"
		]
	end

end