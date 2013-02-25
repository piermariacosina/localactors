begin
	require 'deadweight'
rescue LoadError
end

desc "run DeadWeight CSS check"
task :deadweight do
	dw = Deadweight.new
	dw.stylesheets = ["/stylesheets/application.css"]
	dw.pages = ["/ourapproach","/callforprojects","/"]
	dw.ignore_selectors = /hover|flash_notice|flash_error|errorExplanation|fieldWithErrors/
	puts dw.run
end