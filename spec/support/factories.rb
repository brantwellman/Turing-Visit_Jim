FactoryGirl.define do
  factory :user do
    name
    password
    email
    role 0

      factory :user_with_gymvisit do
        gymvisits { create_list(:gymvisit, 1) }
      end

      factory :user_with_gymvisits do
        gymvisits { create_list(:gymvisit, 3) }
      end
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

  factory :gymvisit do
    date "01/01/2016"
    calories_burned
  end

  sequence :calories_burned, [1500, 2000, 2500].cycle do |n|
    n
  end

end
