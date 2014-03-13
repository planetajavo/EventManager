# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	#la syntax del bucle implicito del email es de FactoryGirl
  	email { |n| "email#{n}@example.com" }
  	password "12345678"
  	password_confirmation "12345678"
  end
end
