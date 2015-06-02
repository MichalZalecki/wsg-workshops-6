require 'rails_helper'

describe User do

  let(:user) { User.new }

  context "creating user" do

    it 'should have initial name' do
      user = User.create
      expect(user.name).to eq('Anonim')
    end

    it 'should have empty messages collection' do
      user = User.create
      expect(user.messages).to eq([])
    end

  end

  context "calculations" do

    it 'should have method named "calculations"' do
      expect(user).to respond_to('calculations')
    end

    it 'should have an attribute named "full_name"' do
      expect(user).to respond_to(:full_name)
    end

    it 'should have an combined email and name in full_name' do
      user.save
      user.calculations
      expect(user.full_name).to eq("#{user.name} #{user.email}")
    end

  end
end
