class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create

    if @angel = AngellistApi.startup_search(:slug => params[:company][:name])

        @company = Company.new
        @company.name = @angel.name
        @company.angellist_id = @angel.id
        @company.angellist_url = @angel.angellist_url
        @company.logo_url = @angel.logo_url
        @company.company_url = @angel.company_url
        @company.twitter_url = @angel.twitter_url
        @company.blog_url = @angel.blog_url
        @company.product_desc = @angel.product_desc
        @company.follower_count = @angel.follower_count
        @company.high_concept = @angel.high_concept

    else
      flash[:notice] = "Angel list api error, nothing saved"
    end

    

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  def parse

    @company = Company.find(params[:id])

    ## parse roles
    @roles = AngellistApi.get_startup_roles(:startup_id => @company.angellist_id)

    @roles.startup_roles.each do |role|

      ## look up if person exists
      if @person = Person.where(:angellist_id => role.user.id).first
        
      else
        @person = Person.new
        @person.angellist_id = role.user.id
        @person.name = role.user.name
        @person.bio = role.user.bio
        @person.angellist_url = role.user.angellist_url
        @person.image = role.user.image
        @person.follower_count = role.user.follower_count
        @person.save
      end

      ## look up if roles exists
      if !CompanyPerson.where(:company_id => @company.id, :person_id => @person.id, :role => role.role).first

        @cp = CompanyPerson.new
        @cp.company_id = @company.id
        @cp.person_id = @person.id
        @cp.role = role.role
        @cp.save

      end

    end

    ## parse followers
    #begin

      @followers = AngellistApi.get_startup_follower_ids(@company.angellist_id)

      @followers.ids.each do |follower_id|

        ## look up if person exists
        if @person = Person.where(:angellist_id => follower_id).first
          
        else
          @person = Person.new
          @person.angellist_id = follower_id
          # @person.name = follower.name
          # @person.bio = follower.bio
          # @person.angellist_url = follower.angellist_url
          # @person.image = follower.image
          # @person.follower_count = follower.follower_count
          @person.save
        end

        ## look up if roles exists
        if !CompanyPerson.where(:company_id => @company.id, :person_id => @person.id, :role => "follower").first

          @cp = CompanyPerson.new
          @cp.company_id = @company.id
          @cp.person_id = @person.id
          @cp.role = "follower"
          @cp.save

        end

      end

    #end while @followers.current_page > @followers.last_page

    flash[:notice] = "#{@company.name} has been parsed via angel list"
    redirect_to :action => "index"

  end

end
