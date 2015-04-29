require 'rails_helper'
require 'json'

describe "In general", Article do
  context ', while API processing' do
    it 'retrieves data from API' do
      query = "per_page=12"
      article_list = Article.get_articles(query)

      expect(article_list).to be_kind_of(Array)
      expect(article_list.length).to eq(12)
    end

    it 'passes http status code if not 200' do
      query = "per_page=12&force_response_code=410"
      article_list = Article.get_articles(query)
      expect(article_list).to eq(410)
    end
  end

end

describe "An Instance of", Article do
  before :each do
    @article = Article.create(item_id: 33)
  end

  context "when new" do
    it "should be properly initialized" do
      expect(@article).to be_a(Article)
    end

    it "has an item_id" do
      expect(@article.item_id).to eq(33)
    end
  end
end
