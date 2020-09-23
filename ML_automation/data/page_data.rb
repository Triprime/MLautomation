class PageData
	# @user_id = TestData.get_user_fixtures["fixture_1"]["user_id"] 	# Account Admin
	@user_id = TestData.get_user_fixtures["fixture_2"]["user_id"]	# Permissions QA account member


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


end