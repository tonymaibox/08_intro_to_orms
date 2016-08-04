class Tweet
  attr_accessor :message, :username, :id
  
  def initialize(options)
    @message = options[:message]
    @username = options[:username]
    @username = options[:id]
  end

end
