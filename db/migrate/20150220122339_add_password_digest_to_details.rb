class AddPasswordDigestToDetails < ActiveRecord::Migration
  def change
    add_column :details, :password_digest, :string
  end
end
