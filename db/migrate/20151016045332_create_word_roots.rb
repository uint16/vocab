class CreateWordRoots < ActiveRecord::Migration
  def change
    create_table :word_roots do |t|
      t.string :root_name
      t.string :root_definition

      t.timestamps null: false
    end
  end
end
