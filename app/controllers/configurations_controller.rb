class ConfigurationsController < ApplicationController
  # GET /configurations
  # GET /configurations.xml
  def index
    authorize! :read, Configuration
    @configurations = Configuration.find(:all,:order=>'sequence')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @configurations }
    end
  end

  # GET /configurations/1/edit
  def edit
    authorize! :edit, Configuration
    @configuration = Configuration.find(params[:id])
  end

  # POST /configurations
  # POST /configurations.xml
  def create
    authorize! :create, Configuration
    @configuration = Configuration.new(params[:configuration])

    respond_to do |format|
      if @configuration.save
        flash[:notice] = 'Configuration was successfully created.'
        format.html { redirect_to(configurations_url) }
        format.xml  { render :xml => @configuration, :status => :created, :location => @configuration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @configuration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /configurations/1
  # PUT /configurations/1.xml
  def update
    authorize! :edit, Configuration
    @configuration = Configuration.find(params[:id])
    respond_to do |format|
      if @configuration.update_attributes(params[:configuration])
        flash[:notice] = 'Configuration was successfully updated.'
        format.html { redirect_to(configurations_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @configuration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /configurations/merge_defaults
  def merge_defaults
    authorize! :merge_default, Configuration
    Configuration.merge_defaults
    flash[:notice] = 'Default configurations merged.'
    redirect_to(configurations_url)
  end

end
