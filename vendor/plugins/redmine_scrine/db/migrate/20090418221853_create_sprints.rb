class CreateSprints < ActiveRecord::Migration
  def self.up
    create_table :sprints do |t|
      t.column :name, :string
    end
  end

  def self.down
    drop_table :sprints
  end
end
