require 'spec_helper'

describe Treasure do
  
  describe ".recent" do
    it "returns X recent treasures (5 by default)" do
      FactoryGirl.create_list(:treasure, 3)
      Treasure.recent(2).should have(2).entries
    end
  end

end
