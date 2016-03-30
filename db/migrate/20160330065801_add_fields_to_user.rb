class AddFieldsToUser < ActiveRecord::Migration
  def change
   add_column :users, :father_name, :string
   add_column :users, :date_of_birth, :date
   add_column :users, :guradian_name, :string
   add_column :users, :guardian_contact_info, :string
   add_column :users, :relation_with_guardain, :string
   add_column :users, :emrgency_phone, :string
   add_column :users, :year_of_admission, :date
   add_column :users, :full_address, :text
   add_column :users, :home_phone, :string
  end
end
