class BuzzfeedCli::Scraper

  def scrape_stories
    @doc = Nokogiri::HTML(open("http://www.buzzfeed.com/"))

    @doc.search("li.grid-posts__item").each do |story_section|
      story = BuzzfeedCli::Story.new
      story.title = story_section.search("h2.lede__title").text.strip
      story.description = story_section.search("p.lede__kicker").text.strip
      story.author = story_section.search(".small-meta__item:first-child").text.strip
      story.published = story_section.search(".small-meta__item__time-ago").text.strip
      story.save
    end

  end

end
