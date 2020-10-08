5.times do
    User.create(first_name: Faker::JapaneseMedia::DragonBall.character, last_name: Faker::Name.last_name, email_address: Faker::Internet.email, username: Faker::Name.unique.name, long_term_goal: Faker::TvShows::TwinPeaks.quote, password: Faker::Lorem.word)
end

5.times do
    Post.create(theme: ["food", "fitness", "social/other"].sample, content: Faker::Movies::PrincessBride.quote, user_id: 1)
    Goal.create(description: Faker::TvShows::StrangerThings.quote, how_long: ["1 month", "A year", "2 weeks", "3 days"].sample, reward: Faker::Dessert.variety, user_id: 1)
end

5.times do
    Post.create(theme: ["food", "fitness", "social/other"].sample, content: Faker::Movies::PrincessBride.quote, user_id: 2)
    Goal.create(description: Faker::TvShows::StrangerThings.quote, how_long: ["1 month", "A year", "2 weeks", "3 days"].sample, reward: Faker::Dessert.variety, user_id: 2)
end

5.times do
    Post.create(theme: ["food", "fitness", "social/other"].sample, content: Faker::Movies::PrincessBride.quote, user_id: 3)
    Goal.create(description: Faker::TvShows::StrangerThings.quote, how_long: ["1 month", "A year", "2 weeks", "3 days"].sample, reward: Faker::Dessert.variety, user_id: 3)
end

5.times do
    Post.create(theme: ["food", "fitness", "social/other"].sample, content: Faker::Movies::PrincessBride.quote, user_id: 4)
    Goal.create(description: Faker::TvShows::StrangerThings.quote, how_long: ["1 month", "A year", "2 weeks", "3 days"].sample, reward: Faker::Dessert.variety, user_id: 4)
end

5.times do
    Post.create(theme: ["food", "fitness", "social/other"].sample, content: Faker::Movies::PrincessBride.quote, user_id: 5)
    Goal.create(description: Faker::TvShows::StrangerThings.quote, how_long: ["1 month", "A year", "2 weeks", "3 days"].sample, reward: Faker::Dessert.variety, user_id: 5)
end

Journal.create(water_intake: Faker::Number.within(range: 1..10), notes: Faker::TvShows::Community.quotes, mood: ["happy", "sad", "bloated", "health", "amazing", "tired", "sleepy"].sample, calories_in: Faker::Number.within(range: 1000..1900), calories_out: Faker::Number.within(range: 100..400), calorie_goal: Faker::Number.within(range: 1200..2400), user_id: 1)
Journal.create(water_intake: Faker::Number.within(range: 1..10), notes: Faker::TvShows::Community.quotes, mood: ["happy", "sad", "bloated", "health", "amazing", "tired", "sleepy"].sample, calories_in: Faker::Number.within(range: 1000..1900), calories_out: Faker::Number.within(range: 100..400), calorie_goal: Faker::Number.within(range: 1200..2400), user_id: 2)
Journal.create(water_intake: Faker::Number.within(range: 1..10), notes: Faker::TvShows::Community.quotes, mood: ["happy", "sad", "bloated", "health", "amazing", "tired", "sleepy"].sample, calories_in: Faker::Number.within(range: 1000..1900), calories_out: Faker::Number.within(range: 100..400), calorie_goal: Faker::Number.within(range: 1200..2400), user_id: 3)
Journal.create(water_intake: Faker::Number.within(range: 1..10), notes: Faker::TvShows::Community.quotes, mood: ["happy", "sad", "bloated", "health", "amazing", "tired", "sleepy"].sample, calories_in: Faker::Number.within(range: 1000..1900), calories_out: Faker::Number.within(range: 100..400), calorie_goal: Faker::Number.within(range: 1200..2400), user_id: 4)
Journal.create(water_intake: Faker::Number.within(range: 1..10), notes: Faker::TvShows::Community.quotes, mood: ["happy", "sad", "bloated", "health", "amazing", "tired", "sleepy"].sample, calories_in: Faker::Number.within(range: 1000..1900), calories_out: Faker::Number.within(range: 100..400), calorie_goal: Faker::Number.within(range: 1200..2400), user_id: 5)

# to add more seed data:
        # delete dev and schema
        #re migrate 
        #re seed
    