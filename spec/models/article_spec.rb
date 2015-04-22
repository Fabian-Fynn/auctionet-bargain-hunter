require 'rails_helper'
require 'json'

describe Article do
  context 'validate article model' do
    it 'retrieves data from API' do
      query = "per_page=12"
      article_list = Article.get_articles(query)

      expect(article_list).to be_kind_of(Array).or be_kind_of(Fixnum)

      unless article_list.is_a? Fixnum
        expect(article_list.length).to eq(12)
      end
    end
  end
end
