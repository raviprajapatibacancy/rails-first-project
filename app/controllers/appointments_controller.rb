class AppointmentsController < ApplicationController
  layout 'custom'
  def new
    @appointment = Appointment.new
    @category = Category.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
       redirect_to :action => 'index'
    else
      respond_to do |format|
        format.html{
          render :new,
          status: :unprocessable_entity
        }
      end
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
     
    if @appointment.update(appointment_params)
       redirect_to :action => 'index', :id => @appointment
    else
       render :action => 'edit'
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @category = Category.all
  end

  def destroy
    Appointment.find(params[:id]).destroy
     redirect_to :action => 'index'
  end

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def appointment_params
    params.require(:appointment).permit(:patient_id, :phsician_id, :appointment_date)
 end
end
