class BuzzfeedCli::Story
  attr_accessor :title, :description, :author, :published, :url
  @@all = []

  def self.all
    @@all
  end

  def save #pushes each instance of the story class into the class array
    @@all << self
  end

  def open_story
    system("open 'http://www.buzzfeed.com#{url}'")
  end


end
