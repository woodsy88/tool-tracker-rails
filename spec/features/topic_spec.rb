require 'rails_helper'

describe 'navigate' do
  before do
    @topic = FactoryGirl.create(:topic)
  end
  describe 'index' do
    it 'can be reached succesfully' do
      visit topics_path
      expect(page.status_code).to eq(200)
    end

    it 'renders a list of topics' do
      FactoryGirl.create(:second_topic)
      visit topics_path
      expect(page).to have_content(/Version|Coding/)
    end

    it 'each topic links to its show page' do
        visit topic_path(@topic)
        expect(page).to have_link(@topic.title, href: topic_tools_path(topic_id: @topic))
    end
  end

  describe 'show' do
    before do
      visit topic_path(@topic)
    end

    it 'can be reached succesfully' do
      expect(page.status_code).to eq(200)
    end

    it 'should display the topic title' do
      expect(page). to have_css('h2', text: 'Email')
    end
    
    it 'should have a url that matches the custom url slug' do
      expect(current_path).to have_content('email')
    end
  end

  describe 'form' do
    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit new_topic_path
    end

    it 'can be reached succesfully when navigating to the /new path' do
      expect(page.status_code).to eq(200)
    end

    it 'allows a user to create a topic from the /new page' do
      fill_in 'topic[title]', with: "Star Wars"
      click_on "Save Topic"
      expect(page).to have_content("Star Wars")
    end

    it 'allows users to update an existing topic from the /edit page' do
      visit edit_topic_path(@topic)

      fill_in 'topic[title]', with: "Star Wars"

      click_on 'Update Topic'

      expect(page).to have_content("Star Wars")
    end
  end

end