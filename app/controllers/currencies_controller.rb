class CurrenciesController < ApplicationController

  require_authorization :currency

  # GET /currencies
  # GET /currencies.xml
  def index
    conditions = "type != 'CurrencyMembrane'"
    conditions = [conditions+" and created_by = ?",current_user.id] unless current_user.can?(:admin)
    @currencies = Currency.find(:all,:conditions=>conditions)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @currencies }
    end
  end

  # GET /currencies/1
  # GET /currencies/1.xml
  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  # GET /currencies/new
  # GET /currencies/new.xml
  def new
    check_for_currency_type
    @currency = Currency.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @currency }
    end
  end

  # GET /currencies/1/edit
  def edit
    check_for_currency_type
    @currency = Currency.find(params[:id])
    return if !can_access_currency?
  end

  # GET /currencies/1/player_classes
  def player_classes
    @currency = Currency.find(params[:id])
    render :partial => "player_classes"
  end

  # POST /currencies
  # POST /currencies.xml
  def create
    params_key = params[:currency_params_key]
    currency_params = get_currency_params
    if currency_params[:type].blank?
      # this will end up throwing a "Type can't be blank error later"
      @currency = Currency.new(currency_params)
    else
      @currency = currency_params[:type].constantize.new(currency_params)
      @currency.configuration = params[:config]
    end
    @currency.created_by = current_user.id
    respond_to do |format|
      if @currency.save
        flash[:notice] = 'Currency was successfully created.'
        format.html { redirect_to currencies_url }
        format.xml  { render :xml => @currency, :status => :created, :location => @currency }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @currency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /currencies/1
  # PUT /currencies/1.xml
  def update
    @currency = Currency.find(params[:id])
    return if !can_access_currency?
    currency_params = get_currency_params
    @currency.configuration = params[:config]
#    @currency.type = currency_params[:type]  CANT CHANGE THE CURRENCY TYPE!
    respond_to do |format|
      if @currency.update_attributes(currency_params)
        flash[:notice] = 'Currency was successfully updated.'
        format.html { redirect_to currencies_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @currency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /currencies/1
  # DELETE /currencies/1.xml
  def destroy
    @currency = Currency.find(params[:id])
    @currency.destroy

    respond_to do |format|
      format.html { redirect_to(currencies_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def get_currency_params
    params[params[:currency_params_key]]
  end
  def check_for_currency_type
    @currency_type = params[:currency_type]
    if @currency_type
      raise "unknown currency type" if !Currency.types.include?(@currency_type)
      @currency_type = @currency_type.constantize.new
    end
  end
  def can_access_currency?
    if (@currency.created_by == current_user.id) || current_user.can?(:admin)
      true
    else
      access_denied
      false
    end
  end
end
