FactoryGirl.define do
  factory :topic do
    title 'Email'

    factory :topic_with_tools do
      transient do
        tools_count 2
      end

      after(:create) do |topic, evaluator|
        create_list(:tool, evaluator.tools_count, topic: topic)
      end
    end
  end

  factory :second_topic, class: 'Topic' do
    title 'Coding'
  end
end