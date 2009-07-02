class SprintsController < ApplicationController
  before_filter :find_sprint, :only => [:show, :edit, :update, :destroy]

  # GET /sprints
  # GET /sprints.xml
  def index
    @sprints = Sprint.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @sprints }
    end
  end

  # GET /sprints/1
  # GET /sprints/1.xml
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @sprint }
    end
  end

  # GET /sprints/new
  # GET /sprints/new.xml
  def new
    @sprint = Sprint.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @sprint }
    end
  end

  # GET /sprints/1/edit
  def edit
  end

  # POST /sprints
  # POST /sprints.xml
  def create
    @sprint = Sprint.new(params[:sprint])

    respond_to do |wants|
      if @sprint.save
        flash[:notice] = 'Sprint was successfully created.'
        wants.html { redirect_to(@sprint) }
        wants.xml  { render :xml => @sprint, :status => :created, :location => @sprint }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @sprint.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sprints/1
  # PUT /sprints/1.xml
  def update
    respond_to do |wants|
      if @sprint.update_attributes(params[:sprint])
        flash[:notice] = 'Sprint was successfully updated.'
        wants.html { redirect_to(@sprint) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @sprint.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.xml
  def destroy
    @sprint.destroy

    respond_to do |wants|
      wants.html { redirect_to(sprints_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_sprint
      @sprint = Sprint.find(params[:id])
    end

end
