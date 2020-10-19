module ApplicationHelper

  def display_address(parent)

    if parent.address

      html = <<~HTML
       <p>#{parent.address.address_1}<br>
          #{parent.address.address_2 + '<br>' unless parent.address.address_2.empty? }
          #{parent.address.city}, #{parent.address.state} #{parent.address.zip}</p>
      HTML

      html.html_safe

    end

  end

end