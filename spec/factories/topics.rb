FactoryGirl.define do
  factory :topic do
    title 'Email'
  end

  factory :second_topic, class: 'Topic' do
    title 'Coding'
  end  
end