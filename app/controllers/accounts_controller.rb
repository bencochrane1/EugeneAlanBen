class AccountsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :new, :create, :show]


  def new
    @account = Account.new
    @account.build_owner
  end

  def create
    @account = Account.new(account_params)
    if @account.valid?
        Apartment::Tenant.create(@account.subdomain)
        Apartment::Tenant.switch(@account.subdomain)
        @account.save
        redirect_to new_user_session_url(subdomain: @account.subdomain)
    else
        render action: 'new'
    end
  end

  def index
    @accounts = Account.all
  end

  def edit
      @account = current_account
  end

  def show
    redirect_to subdomain_root_path
  end

  def update
     @account = current_account
     
      if @account.update(account_params)
          redirect_to subdomain_root_path, notice: "Your school has been updated"
      else 
          render :edit
      end
  end

  private
  
  def account_params
    params.require(:account).permit(:subdomain, :tagline, :description, :school_logo_attachments, :school_background_attachments, owner_attributes: [:name, :email, :password, :password_confirmation])
      
  end


end


