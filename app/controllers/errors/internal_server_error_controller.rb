class Errors::InternalServerErrorController < Errors::ErrorsController
  def show
    render(status: 500)
  end
end