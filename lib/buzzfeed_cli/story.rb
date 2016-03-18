class BuzzfeedCli::Story
  attr_accessor :title, :description, :author, :published, :url
  @@stories = []

  def self.all
    @@stories
  end

  def save #pushes each instance of the story class into the class array
    self.class.all << self
  end

  def open_story
    system("open 'http://www.buzzfeed.com#{url}'")
  end

  def more_by_author
    self.class.find_by_author(self.author)
  end

  def self.find_by_author(author)
    @@all.select{|s| s.author == author}
  end

  def self.find(id) #=> 1
    #=> self Story
    self.all[id.to_i - 1]
  end

  def self.random_story
    self.all[rand(self.all.length)]
  end
end
