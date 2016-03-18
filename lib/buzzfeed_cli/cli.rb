class BuzzfeedCli::CLI
  def call
    puts "Welcome"
    BuzzfeedCli::Scraper.new.scrape_stories
    list_stories
  end

  def list_stories
    BuzzfeedCli::Story.all.each_with_index do | story, i |
      puts "#{i + 1} - #{story.title}"
    end
    instructions
  end

  def instructions
    puts "Enter the number for a story you'd like, or random for a random story, list to list all the stories, or exit to end the program."
    input = gets.chomp
    if input.to_i == 0
      handle_strings(input)
    else
      display_story(input)
    end
  end

  def display_story(input)
    if input.to_i > BuzzfeedCli::Story.all.length
      instructions
    else
      story = BuzzfeedCli::Story.find(input)
      puts "#{story.title} - #{story.description} - #{story.author} - #{story.published}"
      puts "----------------------------------"
      puts "Would you like to open this article?"
      input = gets.chomp
      if input == "yes".downcase
        story.open_story
      else
        instructions
      end
    end
  end

  def random_story
    story = BuzzfeedCli::Story.random_story
    puts "#{story.title} - #{story.description} - #{story.author} - #{story.published}"
    puts "----------------------------------"
    puts "Would you like to open this article?"
    input = gets.chomp
    if input == "yes".downcase
      story.open_story
    else
      instructions
    end
  end

  def handle_strings(input)
    if input == "list"
      list_stories
    elsif input == "random"
      random_story
    elsif input == "exit"
      puts "See you next time!"
    else input.to_i == 0
      puts "I don't quite understand what you want."
      instructions
    end
  end

end
