class CreateTagTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_topics do |t|
      t.string :tag_name
      t.integer :short_url_id
      t.integer :user_id
    end
    add_index :tag_topics, :user_id
  end
end
