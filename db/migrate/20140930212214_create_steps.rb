class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :description
      t.references :list, index: true

      t.timestamps
    end
  end
end
