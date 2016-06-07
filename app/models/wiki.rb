class Wiki < ActiveRecord::Base
  belongs_to :user

  has_many :collaborators   # @wiki.collaborators -> collaborator objects array
  has_many :users, through: :collaborators # @wiki.users -> user objects array
  # @wiki.users.include?(user) -> are they a collaborator or not

  def collaborator_for(user)
    collaborators.where(user_id: user.id).first
  end
end
