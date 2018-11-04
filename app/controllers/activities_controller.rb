class ActivitiesController < ApplicationController
  before_action :set_activity, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @activities = current_user.activities
  end

  def new
    @activity = current_user.activities.build
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      redirect_to description_activity_path(@activity), notice: "Saved.."
    else
      flash[:alert] = "Something is wrong.."
      render :new
    end
  end

  def update
    if @activity.update(activity_params)
      flash[:notice] = "Updated successfully.."
    else
      flash[:notice] = "Something is wrong.."
    end
    redirect_back(fallback_location: request.referer)
  end

  def show
  end

  def description
  end

  def photos
  end

  def location
  end

  def price
    my_adult_price = @activity.my_adult_price
    my_child_price = @activity.my_child_price
    int_adult_price = @activity.int_adult_price
    int_child_price = @activity.int_child_price
  end

  private

    def require_admin
      if current_user != current_user.is_admin? || current_user.is_host?
        flash[:alert] = "Only an admin or host can perform this action!"
        redirect_to root_path
      end
    end

    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :description, :price_details, :how_to_directions, :how_to_seats, :activity_info, :refund_policies, :location_title, :location_map, :my_adult_price, :my_child_price, :int_adult_price, :int_child_price, :is_int_price, :sale_price, :full_price, :my_adult_count, :my_child_count, :int_adult_count, :int_child_count, images: [])
    end

end
