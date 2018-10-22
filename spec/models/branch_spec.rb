require 'rails_helper'

RSpec.describe Branch, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

   before(:all) do
    @branch = create(:branch)
  end
  
  it "is valid with valid attributes" do
    expect(@branch).to be_valid
  end
  
  it "has a unique accountnumber" do
    branch = build(:branch, acc_no: "xyz123")
    expect(branch).to_not be_valid
  end
  
  it "has a balance less than 500" do
    branch = build(:branch, balance: <500)
    expect(branch).to_not be_valid
  end
  
  it "is not valid without a accountnumber " do 
    branch = build(:branch, acc_no: nil)
    expect(branch).to_not be_valid
  end
  
  it "is not valid without a balance" do 
    branch = build(:branch, balance: nil)
    expect(branch).to_not be_valid
  end
  
  it "is not valid without an acc_type" do
    branch = build(:branch, acc_type: nil)
    expect(branch).to_not be_valid
  end
end
