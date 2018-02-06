FactoryGirl.define do
  factory :user do
    first_name 'firstname'
    last_name 'lastname'
    email 'mail@gmail.com'
    confirmed false
    token '000000000000000000000000000000'
    password 'password'
    password_confirmation 'password'
  end
end