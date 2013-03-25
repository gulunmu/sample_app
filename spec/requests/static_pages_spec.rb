require 'spec_helper'



describe "Static pages" do
subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector 'title',
      text: "Ruby on Rails Tutorial Sample App" }
    it { should have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    it "should have content 'help'" do
      visit help_path
      page.should have_content('Help')
    end
  end

  describe "About page" do
    it "should have content 'About us'" do
      visit about_path
      page.should have_content('About Us')
    end
  end

end
