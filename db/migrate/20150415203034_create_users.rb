class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :oauth_token, null: false
      t.string :location, null: false
      t.string :picture_url, default: "https://cdn1.iconfinder.com/data/icons/photography-2/512/YPS__human_avatar_portrait_photography_picture_photo-512.png"
      t.references :industry, null: false
      t.string :job
      t.string :golfcourse
      t.string :handicap
      t.text :description
      t.datetime :oauth_expires_at
      t.timestamps null: false
    end
  end
end
