class Tweet
  attr_accessor :message, :username, :id

  def self.all
  	sql = <<-SQL
  	SELECT * 
  	FROM tweets;
  	SQL

  	results = DB[:conn].execute(sql)
  	# results.collect do |result|
  	# 	Tweet.new(result)
 	self.new_from_rows(results)
  end

  def self.new_from_rows(rows)
	  	rows.collect do |result|
			Tweet.new(result)
		end
	end

	def self.find(id)
		sql = <<-SQL
		SELECT *
		FROM tweets
		WHERE id = ?;
		SQL

		result = DB[:conn].execute(sql, id)
		if result.empty?
			puts "No Tweet Found"
		else
			self.new(result.first)
		end
	end

  def initialize(options={})
    @message = options['message']
    @username = options['username']
    @id = options['id']
  end

  def save
  	# make a call to the database to create a row with a message and a username value
  	# sql = <<-SQL
  	#IF STATEMENT
 #  	IF NOT EXISTS (SELECT id 
 #  	FROM tweets 
 #  	WHERE id IS NULL)
 #  	BEGIN
	#   	INSERT INTO tweets (username, message)
	#   	VALUES (?, ?)
	# END
 #  	ELSE
 #  	BEGIN
	#   	UPDATE tweets
	#   	SET message = ?
	# END
	# ;
 #  	SQL




 	if self.id == nil
 		 	sqlnew = <<-SQL
		 	INSERT INTO tweets (username, message)
			VALUES (?, ?);
		 	SQL

			results = DB[:conn].execute(sqlnew, self.username, self.message)
		  	
		  	sql = <<-SQL
		  	SELECT id
		  	FROM tweets
		  	ORDER BY id DESC
		  	LIMIT 1;
		  	SQL
  			
  			resultid = DB[:conn].execute(sql)
  			
  			self.id = resultid.first['id']
  	
		  	# return the tweet
		  	self
	else
		 	sqlupd = <<-SQL
		 	UPDATE tweets
		 	SET message = ?
		 	WHERE id = ?;
		 	SQL
		
			results = DB[:conn].execute(sqlupd, self.message, self.id)
	end

  	# find the row that was just inserted and set the id from that row to this tweets id

end
end
