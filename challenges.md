1. Take a look at the code that's in this directory. Answer the following questions:
  * What is a Gemfile?
  * What's the purpose of the `environment.rb` file in the `config` directory?
  * What's the purpose of the `console.rb` file? Why might that be useful?
  * We have a database called `tweets.db`. Given what you've seen in the code, how might we execute SQL statements on this DB?
  * Our `Tweet` has an initialize method. How many arguments does it take?

2. Write a method on our tweet class called `find` that takes in an ID number as an argument and returns an instance of our Tweet class that corresponds with that row in the database.
For example:

```ruby
  tweet = Tweet.find(1)
  #=> #<Tweet:0x007fcee3bf9870 @id=1, @message="good coffee", @username="coffeedad">
```
