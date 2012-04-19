class CreateResources < ActiveRecord::Migration

  def change
    create_table :resources do |t|
      t.string :video_url
      t.string :video_title
      t.text :video_description
    end
  end
  
end
