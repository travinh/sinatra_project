class DropColumnInSchduleTable < ActiveRecord::Migration
  def change
    remove_column :schedules, :time 
  end
end
