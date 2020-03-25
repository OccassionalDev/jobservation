class AddColumnLocationToInterviews < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :location, :string
  end
end
