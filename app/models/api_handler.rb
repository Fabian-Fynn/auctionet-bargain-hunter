require "rubygems"
require "httparty"

class ApiHandler
  include HTTParty

  def self.call_api(query)
    response = get("https://www.auctionet.com/api/v2/" + query)

    if response.code == 200
      article_list = ArticlesHelper::parse_json(response.body)
    else
      response.code
    end
  end

  def self.get_items(request)
    case request
      when "ending"
        query = "items.json?order=ending&per_page=12"
        response = call_api(query)
        check_response(response)
      when "bargains"
        query = "items.json?order=bid_asc&per_page=100"
        response = call_api(query)
        check_response(response)
        response = response.sort_by { |item| item[:estimate] }.reverse![0..11]
      when "unrecognized"
        query = "items.json?order=bids_count_asc&per_page=100"
        response = call_api(query)
        check_response(response)
        response = response.sort_by { |item| item[:ends_at] }[0..11]
      when "trending"
        query = "items.json?order=bid_on&per_page=100"
        response = call_api(query)
        check_response(response)
        response = response.sort_by { |item| item[:bids].count }.reverse![0..11]
      when /d+/
        query = "items/:" + request + ".json"
        response = call_api(query)
        check_response(response)
      else
        query = "items.json?q=" + request
        response = call_api(query)
        check_response(response)
      end

      return response
  end

  def self.check_response(response)
    if response.class == Array
      return true
    elsif response == 404
      return false
    elsif response == 503
      return false
    elsif response == 500
      return false
    end
  end
end
