class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|

      t.string :url
      t.string :urlHash #will redirect to original url

      t.timestamps
    end
  end
end
