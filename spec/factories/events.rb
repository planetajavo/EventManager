# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do

  	name "event"
  	description "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt, numquam, sit, distinctio ratione ad eos similique maiores excepturi praesentium totam ea nesciunt ab. Nulla, optio, ab quas natus expedita qui."
  	start_at 1.day.from_now
  	end_at 2.day.from_now


  end
end
