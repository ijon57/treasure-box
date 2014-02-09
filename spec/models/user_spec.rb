require 'spec_helper'

describe User do

  describe "creating new user" do

    it "is invalid without email" do
      user = User.new
      user.should be_invalid
    end

    it "is invalid with invalid email" do
      user = User.new(email: "test", password: "testpassword")
      user.should be_invalid
    end

    it "is invalid if password is missing" do
      user = User.new(email: "user@mail.test")
      user.should be_invalid
    end

    it "is valid if email and password are valid" do
      user = User.new(email: "user@mail.test", password: "testpassword")
      user.should be_valid
    end
  end
end
