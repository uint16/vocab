class UsersController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user =  User.find_by(email: params[:user][:email])
    @user = User.new(user_params) if @user.nil?
    course = Course.find(params[:user][:course_id])
    @user.new_user_added_to_course(course)

    respond_to do |format|
      if @user.save

        format.html { redirect_to course_manage_students_path(course), notice: 'You have successfully registered a student for your class.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find params[:id]
    respond_to do |format|
      if @user.update(user_update_params)
        format.html { redirect_to :back, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to potentials_path, notice: "User deleted."
  end

  def add_role
    user = User.find(params[:user][:user_id])
    user.add_role(params[:user][:role])
    redirect_to :back
  end

  def remove_role
    user = User.find(params[:user][:user_id])
    user.remove_role(params[:user][:role])
    redirect_to :back
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end