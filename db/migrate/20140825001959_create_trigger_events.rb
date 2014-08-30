class CreateTriggerEvents < ActiveRecord::Migration
  def change
    create_table :trigger_events do |t|
      t.string :subject
      t.text :text

      t.timestamps
    end
  end
end
