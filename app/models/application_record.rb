class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def blank_address(attributes)
    attributes[:address_1].blank?
  end
end
