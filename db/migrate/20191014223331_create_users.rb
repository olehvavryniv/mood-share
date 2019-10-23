class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :slack_id
      t.string :team_name
      t.string :team_id
      t.string :image_url_32
      t.string :image_url_72
      t.string :image_url_192

      t.timestamps
    end
  end
end
