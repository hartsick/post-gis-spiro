class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.float :lat
      t.float :lng
      t.references :user, index: true

      t.timestamps
    end
  end
end
