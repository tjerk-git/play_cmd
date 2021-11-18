class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.string :title, null: false
      t.string :slug, null: false

      t.string :small_title, null: false
      t.string :community_avatar, null: false, default: "blob-1.png"

      t.text :summary, null: true

      t.integer :owner, null: false # Uncomment when you want creator to be the owner
      t.integer :created_by, null: false

      # Optional stuff (ready for discussion)

      # t.string :category, null: true
      # t.string :bg_color_hex, null: true, default: "#fff"
      # t.string :text_color_hex, null: true, default: "#000"
      # t.text :wiki_markdown, null: true

      t.timestamps
    end
  end
end
