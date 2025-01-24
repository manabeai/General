class CreateSchoolClasses < ActiveRecord::Migration[8.0]
  def change
    create_table :school_classes do |t|
      t.string :name
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
