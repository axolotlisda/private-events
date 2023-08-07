class RenameInviteeIdToInviteeIdInInvites < ActiveRecord::Migration[7.0]
  def change
    rename_column :invites, :Invitee_id, :invitee_id
  end
end
