require 'rails_helper'

describe 'tool' do
  before do
    @topic = FactoryGirl.create(:topic)
  end

  describe 'nested route' do
    it 'has an index page properly nested under a topic' do
      visit topic_tools_path(topic_id: @topic)
      expect(page.status_code).to eq(200)
    end
  end
end