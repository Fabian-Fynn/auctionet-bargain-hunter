class MakeArticleBelongingToUser < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :integer
    add_reference :articles, :user, index: true, foreign_key: true
  end
end
