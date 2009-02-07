class HomeController < ApplicationController
  helper :activities
  require_authentication :except => :logged_out
  require_authorization :admin,:only => :version
  def home
    @user = User.find(params[:user_id]) if params[:user_id]
    if @user
      @who = @user.first_name+"'s"
    else
      @who = 'My'
      @user = current_user
    end
    @proposals_total_my = Proposal.count(:conditions=>["user_id = ?",@user.id])
    @proposals_total =  Proposal.count
   
    @intentions_total_my = @user.intentions.size
    @intentions_total =  Weal.count(:conditions=>"phase = 'intention'")

    @projects_total_my = @user.projects.size
    @projects_total =  Weal.count(:conditions=>"phase = 'project'")
  end

  def logged_out
  end

  def admin
  end
  
  def version
    response.content_type = 'text/plain'
    render :text=>'version 0.0.1'
#    render :text=>`git log -1`
  end

end
