def find_element(type=:css, element)
	@selenium.find_element(type, element)
end

def click(type=:css, element)
	find_element(type, element).click
	# puts("Clicked: #{type} #{element}")
end

def clear(type=:css, element)
	find_element(type, element).clear
end

def send_keys(type=:css, element, text)
	find_element(type, element).send_keys(text)
end

def hover(type=:css, element)
	target = find_element(type, element)
	@selenium.action.move_to(target).perform
end

def get_url(url)
	@selenium.get(url)
	check_for_502
end

def element_displayed?(type,element)
	if @selenium.find_elements(type, element).size > 0
		return true
	else
		return false
	end
end