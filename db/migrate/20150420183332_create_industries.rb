class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :name, null: false
    end
  end
end
