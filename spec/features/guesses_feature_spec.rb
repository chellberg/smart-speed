require 'spec_helper'

describe "Guesses features" do
  subject { page }
  before { visit root_url }
  let!(:guess) { FactoryGirl.create(:guess) }
  
  shared_examples_for "all guesses pages" do
    it { should have_title(full_title(page_title)) }
  end
  
  describe "Show guesses#index" do
    before { click_link "All guesses" }
    let(:page_title) { 'All' }
    it_should_behave_like "all guesses pages"
    
      it { should have_content(guess.address) }
      it { should have_content(guess.latitude) }
      it { should have_content(guess.longitude) }
      it { should have_content(guess.speed) }
      it { should have_content(guess.speed_limit) }

  end
end