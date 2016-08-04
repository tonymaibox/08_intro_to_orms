1. Take a look at the code that's in this directory. Answer the following questions:
  * What is a Gemfile?
  * What's the purpose of the `environment.rb` file in the `config` directory?
  
2. Write a method on our tweet class called `find` that takes in an ID number as an argument and returns an instance of our Tweet class that corresponds with that row in the database.
For example:

```ruby
tweet = Tweet.find(1)
#=> <Tweet @id=1, @message='I'm the first tweet', @username='coffeedad'>
```
