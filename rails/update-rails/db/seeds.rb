# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# ユーザーを3人作成
users = []
3.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    created_at: Faker::Time.backward(days: 30),
    updated_at: Faker::Time.backward(days: 20)
  )
  users << user
end

# ツイートを10件作成
10.times do
  Tweet.create!(
    content: Faker::Lorem.sentence(word_count: 10),
    created_at: Faker::Time.backward(days: 15),
    updated_at: Faker::Time.backward(days: 5),
    user_id: users.sample.id # ランダムなユーザーを紐付け
  )
end

puts "Seedデータの作成が完了しました！"
puts "Users: #{User.count}, Tweets: #{Tweet.count}"
