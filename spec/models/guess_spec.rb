require 'spec_helper'

describe Guess do
  let(:guess) { FactoryGirl.create(:guess) }
  let(:mixed_case_address) { "New York, NY" }
  # let!(:newguess) { Guess.new }
 
  
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
  
  describe "when city is not present" do
    before { guess.city = " " }
    it { should_not be_valid }
  end
  
  describe "when state is not present" do
    before { guess.state = " " }
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
  
  
  
  describe "email address with mixed case" do
    before do
      guess.address = mixed_case_address
      guess.save
    end
    
    it "should be saved as mixed case" do
       expect(guess.address).to eq mixed_case_address
    end 
  end
  
  describe "reverse geocoding" do
    it "should reverse geocode upon save" 
  end
  
  
  
  describe "nearbys tests", :pending => true do 
    let(:near) { Guess.create(:address => "455 Woodland Trail Dr, Indianapolis IN", 
                              :speed => 45, :speed_limit => 30) }
                              
      it "should locate nearby guesses" do           
        guess.nearbys(50).should_not be_nil 
      end
  end
  
  describe "in the Guess controller", :pending => true do
    before do
        newguess.speed = 55
        newguess.speed_limit = 45
        newguess.address = "809 S Fess Ave 47401"
    end

    it "should create a new guess" do  
      expect(newguess.save).to change(Guess, :count).by(1)
    end 
  end
  

end