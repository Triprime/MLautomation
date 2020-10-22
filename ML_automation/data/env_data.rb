class EnvironmentData

	def self.get_base_url
		# set environment variable with one of the following console commands just before test run:
		# export environment=production
		# export environment=mwho
		{
			"production" 	=> "https://app.mavenlink.com",
			"mwho" 			=> "https://app.mwho.mvn.link"
		}[self.get_environment]


		# below are placeholder base urls when not using the environment variable (above) for test runs
		# comment out the hash above and uncomment the appropriate base url below
		# "https://app.mavenlink.com"
		# "https://app.mwho.mvn.link"
	end

	def self.get_environment
		# get the environment variable.  if it isn't set, use "mwho" as a default
		ENV['environment'] || "mwho" 
	end

end