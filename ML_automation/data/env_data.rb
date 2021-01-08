class EnvironmentData

	def self.get_base_url
		# set environment variable with one of the following console commands just before test run:
		# export environment=production
		# export environment=mwho
		#
		# before running tests on an environment, an account and members must be manually created,
		# then added to user_data.rb
		{
			"production" 	=> "https://app.mavenlink.com", # Currently, no account set up on production
			"mwho" 			=> "https://app.mwho.mvn.link",
			"railsnext"		=> "https://app.railsnext.mvn.link"
		}[self.get_environment]


		# below are placeholder base urls when not using the environment variable (above) for test runs.
		# comment out the hash above and uncomment the appropriate base url below
		# "https://app.mavenlink.com"
		# "https://app.mwho.mvn.link"
	end

	def self.get_environment
		# get the environment variable.  if it isn't set, use "mwho" as a default
		ENV['environment'] || "mwho" 
	end

end