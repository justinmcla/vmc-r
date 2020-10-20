class Address < ApplicationRecord

  validates :state, inclusion: { 
    in: %w(AL AK AZ AR CA CO 
           CT DC DE FL GA HI 
           ID IL IN IA KS KY 
           LA ME MD MA MI MN 
           MS MO MT NE NV NH 
           NJ NM NY NC ND OH 
           OK OR PA RI SC SD 
           TN TX UT VT VA WA 
           WV WI WY) 
  }
  validates :zip, format: { 
    with: /(\d{5}\-\d{4}|\d{5})/, message: "must be formatted as either ##### or #####-####" 
  }

  belongs_to :addressable, polymorphic: true

end
