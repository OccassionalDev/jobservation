class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.string :company
      t.string :position
      t.string :date 
      t.string :status
    end 
  end
end
