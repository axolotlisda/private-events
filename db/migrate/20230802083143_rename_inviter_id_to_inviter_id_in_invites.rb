class RenameInviterIdToInviterIdInInvites < ActiveRecord::Migration[7.0]
  def change
    rename_column :invites, :Inviter_id, :inviter_id
  end
end
