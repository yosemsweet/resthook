# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resthook_hook, class: "Resthook::Hook" do
    subscribed_resource 'TestObject'
    event 'tested'
    url 'http://test_callback.com/'
    version '1'
    access_token 'foo'
  end
end
