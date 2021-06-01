class DuetsController < ApplicationController
  def index
    matching_duets = Duet.all

    @list_of_duets = matching_duets.order({ :created_at => :desc })

    render({ :template => "duets/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_duets = Duet.where({ :id => the_id })

    @the_duet = matching_duets.at(0)

    render({ :template => "duets/show.html.erb" })
  end

  def create
    the_duet = Duet.new
    the_duet.creator_id = params.fetch("query_creator_id")
    the_duet.song_id = params.fetch("query_song_id")
    the_duet.private = params.fetch("query_private", false)
    the_duet.looking = params.fetch("query_looking", false)

    if the_duet.valid?
      the_duet.save
      redirect_to("/duets", { :notice => "Duet created successfully." })
    else
      redirect_to("/duets", { :notice => "Duet failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_duet = Duet.where({ :id => the_id }).at(0)

    the_duet.creator_id = params.fetch("query_creator_id")
    the_duet.song_id = params.fetch("query_song_id")
    the_duet.private = params.fetch("query_private", false)
    the_duet.looking = params.fetch("query_looking", false)

    if the_duet.valid?
      the_duet.save
      redirect_to("/duets/#{the_duet.id}", { :notice => "Duet updated successfully."} )
    else
      redirect_to("/duets/#{the_duet.id}", { :alert => "Duet failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_duet = Duet.where({ :id => the_id }).at(0)

    the_duet.destroy

    redirect_to("/duets", { :notice => "Duet deleted successfully."} )
  end
end
