class CreateDelis < ActiveRecord::Migration[6.0]
  def change
    create_table   :delis do |t|
      t.string     :postcord      ,null: false
      t.integer    :prefectur_id  ,null: false
      t.string     :citey         ,null: false
      t.string     :block         ,null: false
      t.string     :building      
      t.string     :phone_number  ,null: false
      
      t.timestamps

      t.references :pay           ,null: false , foreign_key: true
    end
  end
end
