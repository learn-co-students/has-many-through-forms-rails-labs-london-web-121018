class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :comments
  
  def categories_attribures=(categories_attributes)
    categories_attribures.values.each do |attr|
      category = Category.find_or_create_by(attr)
      
      self.categories << category
    end
  end

  def comments_attributes=(comments_attributes)
    comments_attributes.values.each do |cmment|
      comment = Comment.find_or_create_by(cmment)
      self.comments << comment
    end
  end

  def comments_user
    users = []

      self.comments.each do |comment|
        users << comment.user
      end
      users.uniq
  end
end
