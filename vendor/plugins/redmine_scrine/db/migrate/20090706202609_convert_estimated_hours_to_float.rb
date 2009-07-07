class ConvertEstimatedHoursToFloat < ActiveRecord::Migration
  def self.up
    remove_column :issue_roles, :estimated_hours
    add_column :issue_roles, :estimated_hours, :float
  end

  def self.down
    remove_column :issue_roles, :estimated_hours
    add_column :issue_roles, :estimated_hours, :integer
  end
end
