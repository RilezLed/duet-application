class MembersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index] })
  def index
    matching_members = Member.all

    @list_of_members = matching_members.order({ :created_at => :desc })

    render({ :template => "members/index.html.erb" })
  end

  def config
    render({ :template => "members/config_memebers.html.erb" })
  end  

  def show
    the_id = params.fetch("path_id")

    matching_members = Member.where({ :id => the_id })

    @the_member = matching_members.at(0)

    render({ :template => "members/show.html.erb" })
  end

  def create
    the_member = Member.new
    the_member.bandmate_id = params.fetch("query_bandmate_id")
    the_member.duet_id = params.fetch("query_duet_id")
    the_member.instrument_id = params.fetch("query_instrument_id")
    the_member.open = params.fetch("query_open", false)

    if the_member.valid?
      the_member.save
      redirect_to("/members", { :notice => "Member created successfully." })
    else
      redirect_to("/members", { :notice => "Member failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_member = Member.where({ :id => the_id }).at(0)

    the_member.bandmate_id = params.fetch("query_bandmate_id")
    the_member.duet_id = params.fetch("query_duet_id")
    the_member.instrumnet_id = params.fetch("query_instrumnet_id")
    the_member.open = params.fetch("query_open", false)

    if the_member.valid?
      the_member.save
      redirect_to("/members/#{the_member.id}", { :notice => "Member updated successfully."} )
    else
      redirect_to("/members/#{the_member.id}", { :alert => "Member failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_member = Member.where({ :id => the_id }).at(0)

    the_member.destroy

    redirect_to("/members", { :notice => "Member deleted successfully."} )
  end
end
