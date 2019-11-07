class CreateProducerNovelties < ActiveRecord::Migration[5.2]
  def change
    create_table :producer_novelties do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :novelty, foreign_key: true

      t.timestamps
    end
  end
end
