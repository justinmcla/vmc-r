class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def blank_address(attributes)
    attributes[:address_1].blank?
  end

  def blank_contact(attributes)
    attributes[:via].blank? && attributes[:value].blank?
  end
end
