class AddColumnNotesToInterviews < ActiveRecord::Migration[5.2]
  def change
    add_column :interviews, :notes, :string
  end
end