require 'spec_helper'

describe "Guesses features" do
  subject { page }
  before { visit root_url }
  let!(:guess) { FactoryGirl.create(:guess) }
  let(:template) { FactoryGirl.create(:guess_template) }
  
  shared_examples_for "all guesses pages" do
    it { should have_title(full_title(page_title)) }
    it { should have_link('Home', :href => '/' )}
    it { should have_link('Submit') }
  end
  
  describe "All guesses page" do
    before { click_link "All guesses" }
    let(:page_title) { 'All' }
    it_should_behave_like "all guesses pages"
    
      it { should have_content(guess.address) }
      it { should have_content(guess.speed) }
      it { should have_content(guess.speed_limit) }

  end
  
  describe "Guess view page" do
    before { visit "guesses/#{guess.id}" }
    
    it { should have_content("Created") }
    
    it { should have_content(guess.latitude) }
    it { should have_content(guess.longitude) }
  end
  
  describe "New guess page" do
    before { click_link "Submit" }
    let(:page_title) { 'Submit' }
    it_should_behave_like "all guesses pages"
    
    it { should have_content("Street") }
    it { should have_content("City") }
    it { should have_content("State") }
    it { should have_content("Speed limit") }
    it { should have_content("Speed") }
    it { should have_content("Notes") }
    
    describe "with blank information" do
      before { click_button "I solemnly swear that this is good advice" }
      it { should have_content('error') }
    end
    
    describe "with incomplete information" do
      before { fill_in 'Speed', with: 55
      click_button "I solemnly swear that this is good advice" }
      it { should have_content('error') }
    end
    
    describe "with complete information" do
      before { fill_in 'Speed', with: 55
               fill_in 'Speed limit', with: 45 
               fill_in 'Street', with: "Main St"
               fill_in 'City', with: "New York"
               fill_in 'State', with: "NY" }
               
      it "should create a new guess" do
        expect { click_button "I solemnly swear that this is good advice" }.to change(Guess, :count).by(1)
      end         
    end
  end
end