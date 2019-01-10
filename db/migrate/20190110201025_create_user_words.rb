class CreateUserWords < ActiveRecord::Migration[5.2]
  def change
    create_table :user_words do |t|
      t.references :user
      t.references :word
      t.timestamps
    end
  end
end
