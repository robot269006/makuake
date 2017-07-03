class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.text    :pjt_name
      t.string  :pjt_image
      t.text    :pjt_description
      t.integer :money_collected
      t.integer :money_target
      t.date    :deadline
      t.integer :user_type

      t.timestamps
    end
  end
end
