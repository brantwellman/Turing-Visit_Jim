FactoryGirl.define do
  factory :user do
    name
    password
    email
    role 0
  end

    sequence :name, ["Sally", "Beth", "Taylor"].cycle do |n|
      n
    end

    sequence :password, ["sally", "beth", "taylor"].cycle do |n|
      "#{n}isthebest"
    end

    sequence :email, ["sally", "beth", "taylor"].cycle do |n|
      "#{n}@fakeaccount.com"
    end

end
