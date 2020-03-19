class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.integer :user_id
      t.string :company
      t.string :position
      t.string :date 
      t.string :time
    end 
  end
end
