FactoryBot.define do
  factory :user do
    
  end

  factory :event do
      name { "Michael Oldfield" }
      event_time { "2019-09-19 07:03:30 -0700" }
  end

  factory :random_event, class: Event do
    name { Faker::Music::RockBand.name }
    event_time { Faker::Time.forward }
  end

  factory :ticket do
      price { "100" }
  end

  factory :random_ticket, class: Ticket do
    price { Faker::Number.within(0..1000) }
  end
end
