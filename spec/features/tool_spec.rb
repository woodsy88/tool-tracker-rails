require 'rails_helper'

describe 'tool' do
  before do
    @topic = FactoryGirl.create(:topic_with_tools)
  end

  describe 'nested route' do
    before do
      visit topic_tools_path(topic_id: @topic)
    end
    it 'has an index page properly nested under a topic' do
      expect(page.status_code).to eq(200)
    end
    
    it 'renders multiple tools' do
      expect(@topic.tools.count).to eq(2)
    end
    
    it 'has the tool title' do
      expect(page).to have_content('My Great Tool')
    end

    it 'has the tool description' do
      expect(page).to have_content('Amazing content')
    end

    it 'has the name of the user who created the tool' do
      expect(page).to have_content(@topic.tools.last.user.username)
    end

    it 'has tool links that point to tool show pages' do
      expect(page).to have_link(@topic.tools.last.title, href: topic_tool_path(topic_id: @topic, id: @topic.tools.last))
    end    
  end

  describe 'creation' do
    
    before do
      user = FactoryGirl.create(:user)
      # need to add warden to rails helper to use devise method login_as
      login_as(user, :scope => :user)
      visit new_tool_path
    end

    it 'should allow a tool to be created from the form page and redirect to the show page' do
      fill_in 'tool[title]', with: "Hootsuite"
      fill_in 'tool[description]', with: "Social Media Management"
      find_field("tool[topic_id]").find("option[value='#{@topic.id}']").click

      click_on "Save"

      expect(page).to have_css("h2", text: "Hootsuite")      
    end

    it 'should automatically have a topic selected if clicked on new post from the topic page' do
      visit new_tool_path(topic_id: @topic.id)

      fill_in 'tool[title]', with: "Hootsuite"
      fill_in 'tool[description]', with: "Social Media Management"

      click_on "Save"

      expect(page).to have_content("Email")
    end

    it 'should have a user associated with the post' do

      visit new_tool_path

      fill_in 'tool[title]', with: "Hootsuite"
      fill_in 'tool[description]', with: "Social Media Management"
      find_field("tool[topic_id]").find("option[value='#{@topic.id}']").click

      click_on "Save"

      expect(page).to have_content("Jon Snow")
    end    
  end

  describe 'editing' do
    before do
      user = FactoryGirl.create(:user)
      second_user = FactoryGirl.create(:second_user)
      login_as(user, :scope => :user)

      tool = Tool.create!(title: "start title", description: "starter description", topic_id: @topic.id, user_id: user.id)
      visit edit_topic_tool_path(topic_id: @topic.id, id: tool.id)
    end

    it 'allows a user to edit a tool they created' do
      fill_in 'tool[title]', with: "Hootsuite"
      click_on "Save"

      expect(page).to have_content("Hootsuite")
    end

    xit 'does not allow a user to edit a post they did not create' do
      
    end
  end
end