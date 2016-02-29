class CreateTeacherAttendances < ActiveRecord::Migration
  def change
    create_table :teacher_attendances do |t|
      t.integer :school_admin_id
      t.date :present_date
      t.string :status
      t.integer :user_id
      t.timestamps
    end
  end
end
