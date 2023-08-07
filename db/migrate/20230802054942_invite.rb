class Invite < ActiveRecord::Migration[7.0]
  def change
  end
    add_foreign_key :invites, :events, column: :Event_id
    add_foreign_key :invites, :users, column: :Inviter_id
    add_foreign_key :invites, :users, column: :Invitee_id
end
