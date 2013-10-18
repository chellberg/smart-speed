require 'spec_helper'

describe "Static pages" do
  describe "visiting the home page (static_pages/home)" do
    it "should not return an error" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get static_pages_home_path
      response.status.should be(200)
    end
  end
end
