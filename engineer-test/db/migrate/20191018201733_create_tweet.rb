class CreateTweet < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :body, null: false

      t.timestamps
    end
  end
end
