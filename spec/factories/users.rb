FactoryGirl.define do

  factory :user do
    id 1
    username "Test Guy"
    email "jasonschen5@gmail.com"
    password "thisismorethaneight"
    registration_complete true
  end

end