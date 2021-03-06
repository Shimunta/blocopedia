class WikiPolicy < ApplicationPolicy
  def show?
    scope.where(:id => record.id).exists? && (!record.private || record.user == user) #|| record.users.include?(user)
  end

  class Scope < Scope
    def resolve
      wikis = []
      if user && user.admin?
        scope.all
      elsif user && user.premium?
        all_wikis = scope.all
        all_wikis.each do |w|
          if w.private? || w.user == user
            wikis << w
          else w.users.include?(user)
            wikis << w
          end
        end
        wikis
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |w|
          if !w.private? || w.users.include?(user)
            wikis << w
         end
       end
       wikis
      end
    end
  end
end
