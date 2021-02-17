class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.text :name
      t.text :continent
      t.integer :popluation

      t.timestamps
    end
  end
end
