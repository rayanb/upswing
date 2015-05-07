class CreateUsers < ActiveRecord::Migration

  #             <p> Loves to play at {{user.golfcourse}} </p>
  #             <p> Handicap Index {{user.handicap}}</p>
  #             <p> Golf associations affiliated with {{user.golf_associations}}</p>
  #             <p>Rounds played a year {{user.rounds_played}}</p>
  #             <p> Golf clubs member at {{user.member_at}}</p>
  #             <p> Favorite club in the bag {{user.favorite_club}}</p>
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :oauth_token, null: false
      t.string :location_city
      t.string :location_state
      t.float :location_longitude
      t.float :location_latitude
      t.string :picture_url, default: "https://cdn1.iconfinder.com/data/icons/photography-2/512/YPS__human_avatar_portrait_photography_picture_photo-512.png"
      t.references :industry, null: false
      t.string :job
      t.string :golfcourse, default: "N/A"
      t.string :handicap, default: "N/A"
      t.string :golf_associations, default: "N/A"
      t.string :rounds_played, default: "N/A"
      t.string :member_at, default: "N/A"
      t.string :favorite_club, default: "N/A"
      t.string :availability, default: 'N/A'
      t.text :description, default: "N/A"
      t.datetime :oauth_expires_at
      t.timestamps null: false
    end
  end
end
