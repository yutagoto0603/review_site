class Scraping_kaban
  def self.get_products
    agent = Mechanize.new
    page = agent.get("http://shop-parley.com/fs/parley/c/0000000123")
    elements = page.search('.itemCenter')
    elements.each do |ele|
       product_name = ele.search('.itemCatchCopy').inner_text
       price = ele.search('.FS2_itemPrice_addition').inner_text
       item_name = ''
       #description = ele.search('.category_itemcmt_').inner_text
       #puts price
       #product = Kaban.where(:product_name => product_name).first_or_initialize
       product = Kaban.new(:product_name => product_name, :price => price, :item_name => item_name )
       product.price = price
       product.item_name = 'レザークラフト専用工具'
       #product.description = description
       
       product.save
    end
  end

  def self.get_product(youso)
    page = agent.get("http://cocomeister.jp/store/r/r3090/")
    product_name = page.search('.category_itembox p a')
    #price = page.at('.category_itembox .category_item_price').inner_text
  end
end