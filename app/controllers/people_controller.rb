class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  def update_people

    Person.find_in_batches(:batch_size => 50) do |group|
      people = []
      group.each do |person|
        people << person.angellist_id
      end

      @people = AngellistApi.get_users(people)

      @people.each do |person|

        if @person = Person.where(:angellist_id => person.id).first

          puts "found person"

          @person.name            = person.name
          @person.bio             = person.bio
          @person.follower_count  = person.follower_count
          @person.angellist_url   = person.angellist_url
          @person.image           = person.image
          @person.blog_url        = person.blog_url
          @person.online_bio_url  = person.online_bio_url
          @person.twitter_url     = person.twitter_url
          @person.facebook_url    = person.facebook_url
          @person.linkedin_url    = person.linkedin_url
          @person.aboutme_url     = person.aboutme_url
          @person.github_url      = person.github_url
          @person.dribbble_url    = person.dribbble_url
          @person.behance_url     = person.behance_url
          @person.what_ive_built  = person.what_ive_built
          @person.save

        end

        ## DOESNT CURRENTLY UPDATE ROLES

      end

    end

    flash[:notice] = "People Updated"
    redirect_to :action => "index"

  end

  def offsite_update



  end

end
