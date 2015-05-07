class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :user
      t.string :school_name
      t.string :field_of_study
    end
  end
end
