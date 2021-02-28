class AddColumnsToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :has_visited, :boolean
    add_column :visits, :on_bucket_list, :boolean
  end
end
