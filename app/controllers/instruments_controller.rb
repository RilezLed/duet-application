class InstrumentsController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index] })
  def index
    matching_instruments = Instrument.all

    @list_of_instruments = matching_instruments.order({ :created_at => :desc })

    render({ :template => "instruments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_instruments = Instrument.where({ :id => the_id })

    @the_instrument = matching_instruments.at(0)

    render({ :template => "instruments/show.html.erb" })
  end

  def create
    the_instrument = Instrument.new
    the_instrument.instrument_name = params.fetch("query_instrument_name")
    the_instrument.genre = params.fetch("query_genre")

    if the_instrument.valid?
      the_instrument.save
      redirect_to("/instruments", { :notice => "Instrument created successfully." })
    else
      redirect_to("/instruments", { :notice => "Instrument failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_instrument = Instrument.where({ :id => the_id }).at(0)

    the_instrument.instrument_name = params.fetch("query_instrument_name")
    the_instrument.genre = params.fetch("query_genre")

    if the_instrument.valid?
      the_instrument.save
      redirect_to("/instruments/#{the_instrument.id}", { :notice => "Instrument updated successfully."} )
    else
      redirect_to("/instruments/#{the_instrument.id}", { :alert => "Instrument failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_instrument = Instrument.where({ :id => the_id }).at(0)

    the_instrument.destroy

    redirect_to("/instruments", { :notice => "Instrument deleted successfully."} )
  end
end
