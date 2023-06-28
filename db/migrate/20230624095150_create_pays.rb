class CreatePays < ActiveRecord::Migration[6.0]
  def change
    create_table :pays do |t|
      t.timestamps

      # t.references :deli           ,null: false , foreign_key: true
      t.references :user           ,null: false , foreign_key: true
      t.references :item           ,null: false , foreign_key: true
    end
  end
end
