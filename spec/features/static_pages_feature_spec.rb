require 'spec_helper'

describe "Clicking around", :type => :feature do
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1') }
    it { should have_title(full_title(page_title)) }
  end
  
  describe "Home page" do
    
   before { visit static_pages_home_path }
   let(:page_title) { 'Home' }
   it_should_behave_like "all static pages"
   it { should have_content('Lorem') }
   
  end

  describe "visiting the about page" do
    before { visit static_pages_about_path }
    let(:page_title) { 'About' 
      }
    it_should_behave_like "all static pages"  
  end
end