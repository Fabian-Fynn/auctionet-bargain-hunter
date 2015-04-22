module ArticlesHelper
  def self.parse_json(data)
    json_data = JSON.parse(data, symbolize_names: true)
    json_data = json_data[:items]
  end
end