require 'spec_helper'


describe "StaticPages" do
	let (:base_title) { "Ruby on Rails Tutorial Sample App" }
	
	# let 'it' be 'page'
	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector 'title',
                        text: full_title('') }
    it { should_not have_selector 'title', text: '| Home' }
	end

	describe "Help page" do
		before {visit help_path}

		it { should have_selector('h1', text: 'Help') }
  
		# it "should have the content 'Help'" do
    #  visit help_path
    #  page.should have_selector('h1', :text => 'Help')
    # end
		
		it { should have_selector('title', text: full_title('Help')) }
	end

	describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      page.should have_selector('h1', :text => 'About Us')
    end

		it "should have the title 'About Us'" do
      visit about_path
      page.should have_selector('title',
                    :text => "#{base_title} | About Us")
    end
  end

	describe "Contact page" do
		it "should have a heading 'Contact Us'" do
			visit contact_path
			page.should have_selector('h1', :text => 'Contact Us')
		end

		it "should have the title 'Contact Us'" do
			visit contact_path
			page.should have_selector('title', :text => "#{base_title} | Contact Us")
		end
	end
end
