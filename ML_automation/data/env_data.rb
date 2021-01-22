class EnvironmentData

	def self.get_base_url
		# before running tests on an environment, an account and its members must be manually created,
		# then added to user_data.rb
		{
			"production" 	=> "https://app.mavenlink.com", 		# Currently, no automated QA account set up
			"mwho" 			=> "https://app.mwho.mvn.link",
			"railsnext"		=> "https://app.railsnext.mvn.link",
			"webinf"		=> "https://app.webinf.mvn.link",		# Currently, no automated QA account set up
			"quickbooks"	=> "https://app.quickbooks.mvn.link",	# Currently, no automated QA account set up
			"snow"			=> "https://app.snowpeople.mvn.link",	
			"staging1"		=> "https://app.staging1.mavenlink.net",
			"rogue"			=> "https://app.roguesquadron.mvn.link",# Currently, no automated QA account set up
			"msync"			=> "https://app.msync.mvn.link",
			"rpm"			=> "https://app.rpm.mvn.link"			# Currently, no automated QA account set up
		}[self.get_environment]

	end

	def self.get_environment
		# get the environment variable.  if it isn't set, use "mwho" as a default
		ENV['environment'] || "mwho" 
	end

end