# The pre_render Gem

Adds support for a ```pre_render()``` method to Rails controllers.

## Installation

Add the following line to your Rails application's Gemfile:

```ruby
gem "pre_render"
```

## Usage

Let's say you have a ```Person``` model with the accompanying ```PeopleController```.  Then the controller might look something
like this:

```ruby
class PeopleController < ApplicationController

  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # ...

  protected

  def pre_render(view, *args)
    logger.info "Preparing to render the \"#{view}\" view of #{self.class}"
    case view
    when :index
      # ...
    when :edit
      # ...
    # ...
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:first_name, :last_name, :age)
  end

end
```

The ```pre_render()``` method will be called right before Rails' ```render()``` method.  This will give your controller a last chance
to fully initialize any instance variables a view might need to render itself.  If you are using some sort of view model or
presenter construct, this is a good place to initialize or finish initializing it.

The usefulness of this construct becomes apparent when validation comes into play.  Suppose your ```Person``` model looks like this:

```ruby
class Person < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
end
```

When someone goes to create a new ```Person``` record, but forgets to enter a required field and hits the ```Create``` button,
```PeopleController#create()``` will refuse to create the record due to failed validation.  At that point, the controller will want
to render the ```new``` view once more, even though the ```action_name``` is ```create```.  Except this time when ```pre_render()```
is called, the ```view``` argument will rightly be ```:new```, allowing you to do whatever is needed to ensure the view
renders successfully.

## Credits

The idea for this gem came from my time spent working as a classic ASP.NET developer.  The ASP.NET Page Event model supports the
notion of a ```PreRender()``` method being called right before the ```Render()``` method to allow an application's code-behind
class to finish initialization of its properties and fields.

I found this to be useful then, as I do now in the Rails world.

