class Api::V1::AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_appointment, only: %i[show update destroy]

  # GET /appointments
  def index
    render json: @doctor.appointments
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  def create
    return render json: { success: 'error', message: 'Invalid appointment time or reached maximum appointments' } unless valid_time?

    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = @doctor.appointments.find_by!(id: params[:id]) if @doctor
  end

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  # Only allow a trusted parameter "white list" through.
  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_first_name, :patient_last_name, :visit, :kind)
  end

  def valid_time?
    visit_date = Time.zone.parse(params[:visit])
    appointment_count = @doctor.appointments.where(visit: visit_date).count
    ([0, 15, 30, 45].include? visit_date.min) && (appointment_count < 3)
  end
end
