class BuzzfeedCli::Story
  attr_accessor :title, :description, :author, :published
  @@all = []

  def self.all
    @@all
  end

  def save #pushes each instance of the story class into the class array
    @@all << self
  end



end
