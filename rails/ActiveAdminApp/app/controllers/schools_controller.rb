class SchoolsController < ApplicationController
  def school_classes
    school = School.find(params[:id])
    school_classes = school.school_classes
    render json: school_classes
  end
end
