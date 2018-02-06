FactoryGirl.define do
  factory :task do
    title 'title'
    description 'description'
    priority 1
    due_date '10/10/2010'
    user factory: :user
  end
end