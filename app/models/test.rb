class Test < ActiveRecord::Base
	 belongs_to :category

	before_save :downcase_title
	protected
	def downcase_title
       self.title = title.capitalize!
   
	end	
end
