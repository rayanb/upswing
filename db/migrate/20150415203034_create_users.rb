class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :oauth_token, null: false
      t.string :location_city
      t.string :location_state
      t.float :location_longitude
      t.float :location_latitude
      t.string :picture_url, default: "https://cdn1.iconfinder.com/data/icons/photography-2/512/YPS__human_avatar_portrait_photography_picture_photo-512.png"
      t.references :industry
      t.string :job, default: "Job"
      t.text :specialty
      t.string :golfcourse, default: "N/A"
      t.string :handicap, default: "N/A"
      t.string :golf_associations, default: "N/A"
      t.string :rounds_played, default: "N/A"
      t.string :member_at, default: "N/A"
      t.string :favorite_club, default: "N/A"
      t.string :availability, default: 'N/A'
      t.datetime :oauth_expires_at
      t.timestamps null: false
    end
  end

end
