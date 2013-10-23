require 'spec_helper'

describe "Clicking around", :type => :feature do
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_title(full_title(page_title)) }
  end
  
  describe "Home page" do
    
   before { visit root_url }
   let(:page_title) { 'Home' }
   
   it_should_behave_like "all static pages"
   
   it { should have_content('Lorem') }
   it { should_not have_content('Speed Buddy') }
   
      describe "visiting the about page" do
        before { click_link "About" }
        let(:page_title) { 'About' }
        it_should_behave_like "all static pages"  
      end
  
      describe "visiting the contact page" do
        before { click_link "Contact" }
        let(:page_title) { 'Contact' }
        it_should_behave_like "all static pages"
      end
      
      describe "clicking the jumbotron button" do
        before { click_button "Submit a speed!" }
        it { should have_content('Enter any address') }
      end
  end
end