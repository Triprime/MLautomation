require 'yaml'

class TestData

	# attr_accessor :fixture_num

	# def initialize(fixture_num)
	# 	@fixture_num = fixture_num 
	# end


	def self.get_base_url
		#"https://app.mavenlink.com"
		"https://app.mwho.mvn.link"


		# set with the following console command just before test run:
		# export environment=production

		#{
		#	"production" => "https://app.mavenlink.com" 
		#}[self.get_environment]
	end

	def self.get_environment
		ENV['environment'] || "production" 
		# in practice, this should be || "development" or some environment other than production
	end


	def self.get_user_fixtures
		fixture_file = File.join(File.dirname(__FILE__), 'user_fixtures.yml')
		YAML.load_file(fixture_file)
	end
	
	# def self.user_fixture_num(num = 2)
	# 	num
	# end

end