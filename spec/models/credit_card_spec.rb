require 'rails_helper'

RSpec.describe CreditCard, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

   before(:all) do
    @bank = create(:bank)
  end
  
  it "is valid with valid attributes" do
    expect(@bank).to be_valid
  end
  
  it "has a unique accountnumber" do
    bank = build(:bank, acc_no: "xyz123")
    expect(bank).to_not be_valid
  end
  
  it "has a balance less than 500" do
    bank = build(:bank, balance: <500)
    expect(bank).to_not be_valid
  end
  
  it "is not valid without a accountnumber " do 
    bank = build(:bank, acc_no: nil)
    expect(bank).to_not be_valid
  end
  
  it "is not valid without a balance" do 
    bank = build(:bank, balance: nil)
    expect(bank).to_not be_valid
  end
  
  it "is not valid without an acc_type" do
    bank = build(:bank, acc_type: nil)
    expect(bank).to_not be_valid
  end
end
