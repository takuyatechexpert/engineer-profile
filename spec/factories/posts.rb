FactoryBot.define do
  factory :post do
    title {Faker::Book.title}
    comment {Faker::Book.title}
    image {File.open("#{Rails.root}/public/images/test_image.png")}
    url {Faker::Internet.url(host: 'example.com')}
    user
  end
end
