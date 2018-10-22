require 'rails_helper'

RSpec.describe Loan, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

   before(:all) do
    @loan = create(:loan)
  end
  
  it "is valid with valid attributes" do
    expect(@loan).to be_valid
  end
  
  it "has a unique accountnumber" do
    loan = build(:loan, acc_no: "xyz123")
    expect(loan).to_not be_valid
  end
  
  it "has a balance less than 500" do
    loan = build(:loan, balance: <500)
    expect(loan).to_not be_valid
  end
  
  it "is not valid without a accountnumber " do 
    loan = build(:loan, acc_no: nil)
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
