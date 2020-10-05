class TestData

	def self.get_base_url
		#"https://app.mavenlink.com"
		"https://app.mwho.mvn.link"


		# set with the following console command just before test run:
		# export environment=production

		#{
		#	"production" => "https://app.mavenlink.com" 
		#}[self.get_environment]
	end

	# def self.get_environment
	# 	ENV['environment'] || "production" 
	# 	# in practice, this should be || "development" or some environment other than production
	# end

end