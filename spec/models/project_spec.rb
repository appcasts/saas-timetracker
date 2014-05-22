require 'spec_helper'

describe Project do
  describe "associations" do
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :client }
  end

  it "defaults archived to false" do
    expect(Project.new).to_not be_archived
  end
end
