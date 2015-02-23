class AddIndexToDetailsEmail < ActiveRecord::Migration
  def change
    add_index :details, :email, unique: true
  end
end
