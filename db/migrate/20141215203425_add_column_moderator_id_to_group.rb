class AddColumnModeratorIdToGroup < ActiveRecord::Migration
  def up
    add_column :groups, :moderator_id, :integer

    Group.all.each do |group|
      moderator = ThinkFeelDoDashboard::Moderator.where(group_id: group.id).first
      if moderator
        group.update_attributes(moderator_id: moderator.user_id)
      else
        group.update_attributes(moderator_id: User.first.id)
      end
    end

    execute <<-SQL
      ALTER TABLE groups
        ADD CONSTRAINT fk_groups_user
        FOREIGN KEY (moderator_id)
        REFERENCES users(id)
    SQL

    change_column_null :groups, :moderator_id, false
  end

  def down
    remove_column :groups, :moderator_id, :integer

    execute <<-SQL
      ALTER TABLE groups
        DROP CONSTRAINT fk_groups_user
    SQL
  end
end
