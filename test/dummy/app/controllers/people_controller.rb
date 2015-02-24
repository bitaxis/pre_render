class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person, notice: 'Person was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to people_url, notice: 'Person was successfully destroyed.'
  end

  ##
  # Set meta-accessor to keep track of how many times pre_render was invoked

  mattr_accessor :pre_render_invocation_count
  self.pre_render_invocation_count = 0

  protected

  def pre_render(view, *args)
    logger.info ">>>>>"
    logger.info "PreRender::VERSION = #{PreRender::VERSION}"
    logger.info "About to render \"#{view}\" for #{self.class}"
    logger.info ">>>>>"
    self.pre_render_invocation_count += 1
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:name, :age)
    end
end
