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
    puts "Enter the number for a story you'd like to see or random for a random story"
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
      story = BuzzfeedCli::Story.all[input.to_i]
      puts "#{story.title} - #{story.description} - #{story.author} - #{story.published}"
      puts "----------------------------------"
      next_action
    end
  end

  def next_action
    puts "Would you like to open this article?"
    input = gets.chomp
      if input = "yes".downcase
        story.open_story
      else
        instructions
      end
  end

  def handle_strings(input)
    if input == "list"
      list_stories
    elsif input == "random"
      story = BuzzfeedCli::Story.all[rand(BuzzfeedCli::Story.all.length)]
      puts "#{story.title} - #{story.description} - #{story.author} - #{story.published}"
      puts "----------------------------------"
      next_action
    elsif input == "exit"
      puts "See you next time!"
    else input.to_i == 0
      puts "I don't quite understand what you want."
      instructions
    end
  end

end
