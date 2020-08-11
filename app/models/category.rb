class Category < ApplicationRecord

  
  has_many :products
  has_many :images, through: :products
  has_ancestry



  def set_products
    if self.root?
      start_id = self.indirects.first.id
      end_id = self.indirects.last.id
      products = Product.where(category_id: start_id..end_id)

    elsif self.has_children?
      start_id = self.children.first.id
      end_id = self.children.last.id
      products = Product.where(category_id: start_id..end_id)
    
    else
      return self.products
    end
  end


end
