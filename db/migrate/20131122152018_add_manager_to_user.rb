class AddManagerToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :managed_by_user_id
    end

  end
end
