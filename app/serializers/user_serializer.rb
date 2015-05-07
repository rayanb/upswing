class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :job, :location_city, :location_state, :location_longitude, :location_latitude, :industry, :picture_url, :educations, :jobs, :handicap, :golfcourse, :golf_associations, :rounds_played, :member_at, :favorite_club, :availability

      #   t.string :golfcourse, default: "N/A"
      # t.string :handicap, default: "N/A"
      # t.string :golf_associations, default: "N/A"
      # t.string :rounds_played, default: "N/A"
      # t.string :member_at, default: "N/A"
      # t.string :favorite_club, default: "N/A"
end