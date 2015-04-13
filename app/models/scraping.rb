class Scraping

  def self.get_products
    links = []
    agent = Mechanize.new
    next_link = ""
    num = 1
    while true do
      main_page = agent.get('http://eiga.com/now' + next_link)
      elements = main_page.search('.m_unit h3 a')
      if elements.empty?
         puts "empty"
         break
      end
      elements.each do |ele|
        links << ele.get_attribute('href')
      end
      puts links
      links.each do |link|
        get_product('http://eiga.com' + link)
        links = []
      end
      num += 1
      next_link = "/all/release/#{num}"
    end
  end

 
  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.moveInfoBox h1').inner_text
    image_url = page.at('.pictBox img')[:src]
    director_judge = page.at('.staffBox dl dd a span')
    if director_judge != nil
      director = director_judge.inner_text
    end
    open_date_judge = page.at('.moveInfoBox .opn_date')
    if open_date_judge != nil
       open_date = open_date_judge.inner_text
    end

    detail = page.at('.moveInfoBox .outline p').inner_text

    product = Product.where(:title => title).first_or_initialize
    product.image_url = image_url
    product.director = director
    product.open_date = open_date
    product.detail = detail
    product.save
  end

=begin
  def self.get_products
    links = []
    agent = Mechanize.new
    main_page = agent.get("http://eiga.com/now/")
    elements = main_page.search('.m_unit h3 a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end
 
    links.each do |link|
      get_product('http://eiga.com' + link)
    end
  end
=end
end

