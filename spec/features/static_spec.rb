require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end

describe 'header' do
  it 'has a header that displays the users name' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path

    expect(page).to have_content("Jon Snow")
  end

  it 'displays a welcome message to guest users' do
    visit root_path
    expect(page).to have_content("Guest")
  end  
end