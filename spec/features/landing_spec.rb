require 'spec_helper'


describe "Landing" do

	describe "Header" do

		it "should have the content 'header'" do
			visit '/'
			page.should have_content('header')
		end
	end
end