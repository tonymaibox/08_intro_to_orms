class TweetsApp

  def call
    puts 'Welcome to Twitter'
  end

  private

  def display(tweets)
    tweets.each.with_index(1) do |tweet, i|
      puts "#{i}. #{tweet.username} says: #{tweet.message}"
    end
  end
end
