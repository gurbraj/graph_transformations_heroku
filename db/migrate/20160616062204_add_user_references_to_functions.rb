class AddUserReferencesToFunctions < ActiveRecord::Migration
  def change
    add_reference :functions, :user, index: true, foreign_key: true
  end
end
