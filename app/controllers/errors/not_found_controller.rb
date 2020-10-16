class Errors::NotFoundController < Errors::ErrorsController
  def show
    render(status: 404)
  end
end