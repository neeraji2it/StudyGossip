class AddSemesterIdToClass < ActiveRecord::Migration
  def change
    add_column :cls, :semester_id, :integer 
  end
end
