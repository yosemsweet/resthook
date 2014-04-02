class CreateResthookHooks < ActiveRecord::Migration
  def change
    create_table :resthook_hooks do |t|
      t.string :subscribed_resource
      t.string :event
      t.string :url
      t.string :version
      t.string :access_token

      t.timestamps
    end

    add_index :resthook_hooks, [:subscribed_resource, :event]
    add_index :resthook_hooks, :url
    add_index :resthook_hooks, :access_token
  end
end
