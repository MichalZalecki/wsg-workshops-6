class RemoveInfoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :info, :text
  end
end
