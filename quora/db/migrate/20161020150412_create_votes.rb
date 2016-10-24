class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user 
      t.belongs_to :question, null: true
      t.belongs_to :answer, null: true
      t.timestamps
    end
  end
end
