class AddStuffToGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.text :notes
    end
    
    add_column :guesses, :street, :string
    add_column :guesses, :city, :string
    add_column :guesses, :state, :string
    add_column :guesses, :address, :string
    add_column :guesses, :latitude, :float
    add_column :guesses, :longitude, :float
    add_column :guesses, :speed_limit, :int
    add_column :guesses, :speed, :int
  
  end
end
