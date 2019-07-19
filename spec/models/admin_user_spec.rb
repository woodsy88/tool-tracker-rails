require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'creation' do
    it 'can be created' do
      admin = AdminUser.create!(
        email: "admin@test.com",
        password: "asdfasdf",
        password_confirmation: "asdfasdf",
        first_name: "Jon",
        last_name: "Snow",
        username: "wallwatcher"
      )
      expect(admin).to be_valid
    end
  end
end