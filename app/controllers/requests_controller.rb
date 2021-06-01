class RequestsController < ApplicationController
  def index
    matching_requests = Request.all

    @list_of_requests = matching_requests.order({ :created_at => :desc })

    render({ :template => "requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_requests = Request.where({ :id => the_id })

    @the_request = matching_requests.at(0)

    render({ :template => "requests/show.html.erb" })
  end

  def create
    the_request = Request.new
    the_request.requestor_id = params.fetch("query_requestor_id")
    the_request.group_id = params.fetch("query_group_id")
    the_request.instrument_id = params.fetch("query_instrument_id")
    the_request.status = params.fetch("query_status")

    if the_request.valid?
      the_request.save
      redirect_to("/requests", { :notice => "Request created successfully." })
    else
      redirect_to("/requests", { :notice => "Request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_request = Request.where({ :id => the_id }).at(0)

    the_request.requestor_id = params.fetch("query_requestor_id")
    the_request.group_id = params.fetch("query_group_id")
    the_request.instrument_id = params.fetch("query_instrument_id")
    the_request.status = params.fetch("query_status")

    if the_request.valid?
      the_request.save
      redirect_to("/requests/#{the_request.id}", { :notice => "Request updated successfully."} )
    else
      redirect_to("/requests/#{the_request.id}", { :alert => "Request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_request = Request.where({ :id => the_id }).at(0)

    the_request.destroy

    redirect_to("/requests", { :notice => "Request deleted successfully."} )
  end
end
