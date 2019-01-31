class AddProducts < ActiveRecord::Migration[5.2]
  def change
  	Product.create ({
  		:title => 'Hawaiian', 
  		:description => 'This is Hawaiian pizza', 
  		:price => 350, 
  		:size => 30, 
  		:is_spicy => false, 
  		:is_veg => false, 
  		:is_best_offer => false, 
  		:path_to_image => '/images/hawaiian.jpeg'
  	})

  	Product.create ({
  		:title => 'Pepperoni', 
  		:description => 'This is Pepperoni pizza', 
  		:price => 450,	
  		:size => 30, 
  		:is_spicy => true,	
  		:is_veg => false, 
  		:is_best_offer => false, 
  		:path_to_image => '/images/pepperoni.jpeg'
  	})

	Product.create ({
		:title => 'Hawaiian', 
		:description => 'This is Vegetarian pizza', 
		:price => 400, 
		:size => 30, 
		:is_spicy => false, 
		:is_veg => true, 
		:is_best_offer => false, 
		:path_to_image => '/images/veg.jpeg'
	})
	
  end
end
