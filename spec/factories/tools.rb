FactoryGirl.define do
  factory :tool do
    title 'My Great Tool'
    description 'Amazing content'
    topic
    user
  end

  factory :second_tool, class: 'Tool' do
    title 'Another Tool'
    description 'Killer Tool'
    topic
    user
  end
end