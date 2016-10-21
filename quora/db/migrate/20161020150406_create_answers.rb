class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.belongs_to :user
      t.belongs_to :question
      t.timestamps
    end
  end
end
