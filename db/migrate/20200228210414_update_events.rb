class UpdateEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :reminder, :reminder_datetime
    add_column :events, :reminder_note, :string
  end
end
