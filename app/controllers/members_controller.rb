class MembersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index] })
  def index
    matching_members = Member.all

    @list_of_members = matching_members.order({ :created_at => :desc })

    render({ :template => "members/index.html.erb" })
  end



  def show
    the_id = params.fetch("path_id")

    matching_members = Member.where({ :id => the_id })

    @the_member = matching_members.at(0)

    render({ :template => "members/show.html.erb" })
  end

  def create
    num_bandmates = params.fetch("query_bandmate_id").length

    num_bandmates.times do |an_index|
    @the_member = Member.new
    @the_member.bandmate_id = params.fetch("query_bandmate_id").at(an_index)
    @the_member.duet_id = params.fetch("query_duet_id").at(an_index)
    @the_member.instrument_id = params.fetch("query_instrument_id").at(an_index)
    @the_member.open = params.fetch("query_open", false).at(an_index)

      if @the_member.valid?
        @the_member.save
      else
        redirect_to("/duets/", { :notice => "Members and Duet not Created." })
      end
    end
    redirect_to("/duets/#{@the_member.duet_id}", { :notice => "Member created successfully." })
  end

  def update
    the_id = params.fetch("path_id")
    the_member = Member.where({ :id => the_id }).at(0)

    the_member.bandmate_id = params.fetch("query_bandmate_id")
    the_member.duet_id = params.fetch("query_duet_id")
    the_member.instrument_id = params.fetch("query_instrument_id")
    the_member.open = params.fetch("query_open", false)

    if the_member.valid?
      the_member.save
    else
      redirect_to("/duets/#{the_member.duet_id}", { :alert => "Member failed to update successfully." })
    end
    redirect_to("/duets/#{the_member.duet_id}", { :notice => "Member updated successfully."} )
  end

  def destroy
    the_id = params.fetch("path_id")
    the_member = Member.where({ :id => the_id }).at(0)

    the_member.destroy

    redirect_to("/members", { :notice => "Member deleted successfully."} )
  end
end
