require "rubygems"
require "httparty"

class ApiHandler
  include HTTParty

  def self.call_api(query)
    response = get("https://www.auctionet.com/api/v2/items.json?" + query)

    if response.code == 200
      article_list = ArticlesHelper::parse_json(response.body)
    else
      response.code
    end
  end

  def self.get_items(request)
    case request
    when "ending"
      query = "order=ending&per_page=100"
    when "bargains"
      query = "order=ending&per_page=1"
    end
    call_api(query)
  end
end
