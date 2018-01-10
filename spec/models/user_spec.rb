require 'spec_helper'

describe User do

  it "validates the full name" do

    User.new(firstname: "").should_not be_valid
    User.new(lastname: "").should_not be_valid

  end

end