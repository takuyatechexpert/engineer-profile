FactoryBot.define do
  factory :post do
    title {Faker::Book.title}
    comment {Faker::Book.title}
    image {Faker::Avatar.image(slug: "my-own-slug", size: "300x300", format: "jpg")}
    url {Faker::Internet.url(host: 'example.com')}
  end
end
