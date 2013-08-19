class AlterUrls < ActiveRecord::Migration
  def up
    change_column("urls", "codename", :string, :null => false, :unique => true)
  end

  def down
    change_column("urls", "codename", :string, :null => false)
  end
end
