class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :commentable, polymorphic: true

      t.timestamps
    end
    add_index :comments, [:commentable_type, :commentable_id]
  end
end
