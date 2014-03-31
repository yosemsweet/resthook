# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resthook_hook, :class => 'Hook' do
    resource_type "MyString"
    actions "MyString"
  end
end
