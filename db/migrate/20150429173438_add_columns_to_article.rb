class AddColumnsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :item_id,:integer
    add_column :articles, :auction_id,:integer
    add_column :articles, :estimate, :integer
    add_column :articles, :next_bid_amount, :integer
    add_column :articles, :category_id, :integer
    add_column :articles, :ends_at, :integer
    add_column :articles, :currency, :string
    add_column :articles, :state, :string
    add_column :articles, :title, :string
    add_column :articles, :contition, :string
    add_column :articles, :type, :string
    add_column :articles, :location, :string
    add_column :articles, :url, :string
    add_column :articles, :transport_price, :string
    add_column :articles, :description, :text
    add_column :articles, :reserve_met, :boolean
  end
end
