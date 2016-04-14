class ChangeGuardianContactInfoInUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :guardian_contact_info, :text
    end
  end

  def down
    change_table :users do |t|
      t.change :guardian_contact_info, :string
    end
  end
end

