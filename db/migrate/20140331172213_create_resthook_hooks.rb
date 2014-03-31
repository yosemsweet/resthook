class CreateResthookHooks < ActiveRecord::Migration
  def change
    create_table :resthook_hooks do |t|
      t.string :resource_type
      t.string :actions

      t.timestamps
    end
  end
end
