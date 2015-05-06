require "rubygems"
require "httparty"

class ApiHandler
  include HTTParty

  def self.get_items(query)
    response = get("https://www.auctionet.com/api/v2/items.json?" + query)

    if response.code == 200
      article_list = ArticlesHelper::parse_json(response.body)
    else
      response.code
    end
  end
end
