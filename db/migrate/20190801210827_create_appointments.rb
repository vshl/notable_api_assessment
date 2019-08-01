class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, index: true
      t.string :patient_first_name
      t.string :patient_last_name
      t.datetime :visit
      t.boolean :kind

      t.timestamps
    end
  end
end
