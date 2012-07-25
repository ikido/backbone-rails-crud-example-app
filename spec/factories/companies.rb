FactoryGirl.define do
  sequence(:random_string) {|n| LoremIpsum.generate }
  
  factory :company do
    name { Faker::Lorem.word }
    # phone - random number 
    address { Faker::Lorem.sentence }
  end
end