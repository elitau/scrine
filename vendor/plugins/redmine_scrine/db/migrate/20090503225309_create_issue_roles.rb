class CreateIssueRoles < ActiveRecord::Migration
  def self.up
    create_table :issue_roles do |t|
      t.column :issue_id, :integer
      t.column :role_id, :integer
      t.integer :estimated_hours
    end
  end

  def self.down
    drop_table :issue_roles
  end
end
