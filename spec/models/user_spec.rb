require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", user_name: "ryota", user_image: "xxxxx.com", user_description: "he's a dude")
    end

    it 'can create a user' do
      expect(@user).to be_valid
    end

    it 'has user validation working' do
      @user.user_name = nil
      expect(@user).to be_valid
    end
  end
end
