class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|

      t.string "url" , :null => false #user-url
      t.string "codename", :null => false #unique curse word combo

      t.timestamps
    end
  end
end
