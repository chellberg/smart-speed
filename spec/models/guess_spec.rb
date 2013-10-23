require 'spec_helper'

describe Guess do
  let(:guess) { FactoryGirl.create(:guess) }
  
  subject { guess }
  
  it { should respond_to(:speed ) }
  it { should respond_to(:speed_limit )}
  it { should respond_to(:address )}
  it { should respond_to(:city )}
  it { should respond_to(:state )}
  it { should respond_to(:latitude )}
  it { should respond_to(:longitude )}
  it { should respond_to(:nearbys) }

  # it { should respond_to(:user )}
  
  it { should be_valid }
  
  describe "geocoding by an address" do
    its(:longitude) { should_not be_nil }
    its(:latitude)  { should_not be_nil }
  end
  
  describe "when address is not present" do
    before { guess.address = " " }
    it { should_not be_valid }
  end
  
  describe "when speed is not present" do
    before { guess.speed = " " }
    it { should_not be_valid }
  end
  
  describe "when speed limit is not present" do
    before { guess.speed_limit = " " }
    it { should_not be_valid } 
  end
  
  describe "nearbys tests" do
    let(:near) { Guess.create(:address => "455 Woodland Trail Dr, Indianapolis IN", 
                              :speed => 45, :speed_limit => 30) }
                              
      it "should locate nearby guesses" do           
        guess.nearbys(50).should_not be_nil 
      end
  end
  
end