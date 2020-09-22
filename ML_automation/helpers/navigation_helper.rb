def main_navigation_to(nav_option)
	if nav_option === "Your Dashboard"
		locator 		= PageData.your_dashboard[:main_menu_locator]
		locator_type	= PageData.your_dashboard[:main_menu_locator_type]
	end
	if nav_option === "Projects"
		locator 		= PageData.projects[:main_menu_locator]
		locator_type	= PageData.projects[:main_menu_locator_type]
	end
	if nav_option === "Project Templates"
		locator 		= PageData.templates[:main_menu_locator]
		locator_type	= PageData.templates[:main_menu_locator_type]
	end
	if nav_option === "Tasks"
		locator 		= PageData.tasks[:main_menu_locator]
		locator_type	= PageData.tasks[:main_menu_locator_type]
	end
	if nav_option === "General Settings"
		locator 		= PageData.settings[:main_menu_locator]
		locator_type	= PageData.settings[:main_menu_locator_type]
	end

	hover(locator_type, locator)
	click(locator_type, locator)
end


def sub_navigation_to(nav_option)
	if nav_option === "Your Dashboard"
		main_menu_locator 		= PageData.your_dashboard[:main_menu_locator]
		main_menu_locator_type 	= PageData.your_dashboard[:main_menu_locator_type]
		sub_nav_locator 		= PageData.your_dashboard[:sub_nav_locator]
		sub_nav_locator_type 	= PageData.your_dashboard[:sub_nav_locator_type]
	end

	if nav_option === "Activity Feed"
		main_menu_locator 		= PageData.activity_feed[:main_menu_locator]
		main_menu_locator_type 	= PageData.activity_feed[:main_menu_locator_type]
		sub_nav_locator 		= PageData.activity_feed[:sub_nav_locator]
		sub_nav_locator_type 	= PageData.activity_feed[:sub_nav_locator_type]
	end

	if nav_option === "Files"
		main_menu_locator 		= PageData.files[:main_menu_locator]
		main_menu_locator_type 	= PageData.files[:main_menu_locator_type]
		sub_nav_locator 		= PageData.files[:sub_nav_locator]
		sub_nav_locator_type 	= PageData.files[:sub_nav_locator_type]
	end

	hover(main_menu_locator_type, main_menu_locator)
	sleep(1)
	#wait_until_element_displayed(sub_nav_locator_type, sub_nav_locator)
	hover(sub_nav_locator_type, sub_nav_locator)
	click(sub_nav_locator_type, sub_nav_locator)
end
