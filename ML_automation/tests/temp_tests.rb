require_relative '../helpers/test_helper'

class NavigationTests < Test::Unit::TestCase

	# def setup
	# 	@selenium = Selenium::WebDriver.for(:firefox)
	# end

	# def teardown
	# 	@selenium.quit
	# end

	# def test_ag_data
	# 	puts("hash test")

	# 	puts("group_name:  #{AGData.ag_urls[:group_name]}")
	# 	puts("group_id:    #{AGData.ag_urls[:group_id]}")

	# 	urls = AGData.ag_urls[:urls]
	# 	puts("urls_count:  #{urls.count}")

	# 	urls.each do |url|
	# 		puts("   url_id:   #{url[:url_id]}")
	# 		puts("   url_desc: #{url[:description]}") 
	# 		puts("   url:      #{url[:url]}")  
	# 	end
	# end

	def test_ag_data_array
		puts("\narray test")

		urls_array = AGData.ag_urls_array
		puts("url_groups count: #{urls_array.count}")

		urls_array.each do |url_group|
			puts("\ngroup_name:  #{url_group[:group_name]}")
			puts("group_id:    #{url_group[:group_id]}")

			urls = url_group[:urls]
			puts("urls_count:  #{urls.count}")

			urls.each do |url|
				puts("\n   url_id:   #{url[:url_id]}")
				puts("   url_desc: #{url[:description]}") 
				puts("   url:      #{url[:url]}")  
			end
		end
	end

end