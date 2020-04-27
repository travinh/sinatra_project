class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.date :date 
      t.time :time
      t.text :content
    end
  end
end
