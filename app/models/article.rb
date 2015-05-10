class Article < ActiveRecord::Base
  belongs_to :user

  def self.update_articles(user_id)
    articles = Article.where(user_id: user_id)
    articles.each { |article|
      item = ApiHandler.get_items("#{article[:item_id]}")[0]
      article[:ends_at] = item[:ends_at]
      article[:next_bid_amount] = item[:next_bid_amount]
      article[:state] = item[:state]
      article[:reserve_met] = item[:reserve_met]
      article.save
    }
  end

  def self.batch_destroy(user_id)
    articles = Article.where(user_id: user_id).where("ends_at < ?", Time.now.to_i)
    articles.each { |article|
      article.destroy
    }
  end
end
