class TalentsController < ApplicationController
  def index
    matching_talents = Talent.all

    @list_of_talents = matching_talents.order({ :created_at => :desc })

    render({ :template => "talents/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_talents = Talent.where({ :id => the_id })

    @the_talent = matching_talents.at(0)

    render({ :template => "talents/show.html.erb" })
  end

  def create
    the_talent = Talent.new
    the_talent.musician_id = params.fetch("query_musician_id")
    the_talent.instrument_id = params.fetch("query_instrument_id")

    if the_talent.valid?
      the_talent.save
      redirect_to("/talents", { :notice => "Talent created successfully." })
    else
      redirect_to("/talents", { :notice => "Talent failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_talent = Talent.where({ :id => the_id }).at(0)

    the_talent.musician_id = params.fetch("query_musician_id")
    the_talent.instrument_id = params.fetch("query_instrument_id")

    if the_talent.valid?
      the_talent.save
      redirect_to("/talents/#{the_talent.id}", { :notice => "Talent updated successfully."} )
    else
      redirect_to("/talents/#{the_talent.id}", { :alert => "Talent failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_talent = Talent.where({ :id => the_id }).at(0)

    the_talent.destroy

    redirect_to("/talents", { :notice => "Talent deleted successfully."} )
  end
end
