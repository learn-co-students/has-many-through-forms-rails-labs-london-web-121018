class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def users_attributes=(users_attributes)
    
    users_attributes.values.each do |cmment|
      user = User.find_or_create_by(cmment)
      self.user << user
    end
  end
  
end
