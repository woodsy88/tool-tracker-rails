class AddTopicsToTools < ActiveRecord::Migration[5.2]
  def change
    add_reference :tools, :topic, foreign_key: true
  end
end
