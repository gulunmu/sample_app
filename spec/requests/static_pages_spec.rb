require 'spec_helper'



describe "Static pages" do
subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector 'title',
      text: "Ruby on Rails Tutorial Sample App" }
    it { should have_selector 'title', text: '| Home' }


    describe "for signed-in users" do

      let(:user) { FactoryGirl.create(:user)}
      before do

        FactoryGirl.create( :micropost, user: user, 
                           content: "Lorem ipsum")
        FactoryGirl.create( :micropost, user: user,
                           content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do

        user.feed.each do |item|
          page.should have_selector("li##{item.id}",
                                    text: item.content)
        end
      end
    end
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
