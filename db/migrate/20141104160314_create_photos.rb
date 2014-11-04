class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :tag_line
      t.references :album, index: true

      t.timestamps
    end
  end
end
