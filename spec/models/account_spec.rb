require 'rails_helper'

RSpec.describe Account, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @account = create(:account)
  end
  
  it "is valid with valid attributes" do
    expect(@account).to be_valid
  end
  
  it "has a unique accountnumber" do
    account = build(:account, acc_no: "xyz123")
    expect(account).to_not be_valid
  end
  
  it "is not valid without a accountnumber " do 
    account = build(:account, acc_no: nil)
    expect(account).to_not be_valid
  end
  
  it "is not valid without a balance" do 
    account = build(:account, balance: nil)
    expect(account).to_not be_valid
  end
  
  it "is not valid without an acc_type" do
    account = build(:account, acc_type: nil)
    expect(account).to_not be_valid
  end

end
