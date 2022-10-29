require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "Testing factory" do
    context "when using standart factory" do
      it {expect(build(:admin)).to be_valid}
    end
  end
  
  describe "Validating admin" do
    context "Validating email" do
      it "should be invalid if nil" do
        expect(build(:admin, email: nil)).to be_invalid
      end
      it "should be invalid if repetead" do
        create(:admin, email:"trainee@struct")
        expect(build(:admin, email: "trainee@struct")).to be_invalid
      end
    end
    
    context "Validating password" do
      it "should be invalid if nil" do
        expect(build(:admin, email: nil)).to be_invalid
      end
    end
  end
end
