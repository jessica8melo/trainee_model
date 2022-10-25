require 'rails_helper'

RSpec.describe User, type: :model do
  context "Testing factory" do
    it { expect(build(:user)).to be_valid }
    it { expect(build(:user, :admin).is_admin).to eq(true)}
  end

  context "Validating name" do
    it " should be invalid if nil" do
      expect(build(:user, name:nil)).to be_invalid
    end
  end

  context "Validating is_admin" do
    it " should be invalid if nil" do
      expect(build(:user, is_admin: nil)).to be_invalid
    end
  end
end
