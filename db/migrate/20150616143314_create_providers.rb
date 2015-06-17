class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :postcode
      t.text :notes
    end
  end
end
