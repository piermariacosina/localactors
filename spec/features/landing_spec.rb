require 'spec_helper'


describe "Landing" do

	describe "Header" do

		it "should have the content 'header'", :js => true do
			visit '/'
			fill_in('email', :with => 'jon')
			click('submit')
			page.should have_content 'Success'
		end
	end
end