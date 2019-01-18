class AddUserCountToWords < ActiveRecord::Migration[5.2]
  def up
    add_column(:words, :user_count, :integer, default: 0)

    Word.find_each do |word|
      Word.reset_counters(word.id, :users)
    end
  end

  def down
    remove_column(:words, :user_count)
  end
end
