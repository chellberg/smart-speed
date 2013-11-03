class AddFulladdressToGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :full_address, :string
  end
end
