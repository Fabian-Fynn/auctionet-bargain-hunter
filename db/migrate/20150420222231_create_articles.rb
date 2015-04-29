class CreateArticles < ActiveRecord::Migration
  def create
    create_table :articles do |t|

      t.timestamps null: false
    end
  end
end
