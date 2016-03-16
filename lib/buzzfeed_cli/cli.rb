class BuzzfeedCli::CLI
  def call
    puts "Welcome"
    BuzzfeedCli::Scraper.new.scrape_stories
    list_stories
  end

  def list_stories
    #NEED TO FIX INDEX
    BuzzfeedCli::Story.all.each_with_index do | story, i |
      puts "#{i} - #{story.title}"
    end
    instructions
  end

  def instructions
    puts "What story would you like to see?"
    input = gets.chomp
    if input.to_i == 0
      handle_strings(input)
    else
      display_story(input)
    end
  end

  def display_story(input)
    if input.to_i > BuzzfeedCli::Story.all.length
      instructions # have to get input in a better way
    else
      story = BuzzfeedCli::Story.all[input.to_i]
      puts "#{story.title} - #{story.description} - #{story.author} - #{story.published}"
      puts "----------------------------------"
      instructions
    end
  end


  def handle_strings(input)
    if input == "list"
      list_stories
    elsif input == "exit"
      puts "See you next time!"
    else input.to_i == 0
      puts "I don't quite understand what you want."
      instructions
    end
  end


end
