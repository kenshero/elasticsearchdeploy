class MembersController < ApplicationController
  def index
      if params[:q].present? && params[:choice].present?
        @members = Member.member_search(params[:q],params[:choice]).results
        # @members = Member.all
      else
        @members = Member.all
      end
  end

  def new
    @member  = Member.new
  end

  def create
    @member  = Member.new(member_params)
    if @member.save
      redirect_to members_path
    else
      render 'new'
    end
  end

  def edit
  end

  private
    def member_params
      params.require(:member).permit(:firstname,:lastname,:age,:address,:phone)
    end
end
