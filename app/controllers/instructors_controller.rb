class InstructorsController < ApplicationController
wrap_parameters format: []

    def index
        instructors = Instructor.all
        if instructors
            render json: instructors
        else
            render json: {errors: "Instructors not found"}, status: :not_found
        end
    end


    def show
        instructor = Instructor.find_by(id: params[:id])
        if instructor
                render json: instructor
        else
                render json: {errors: "Instructor not found"}, status: :not_found
        end
    end

    def create
        instructor = Instructor.create(name: params[:name])
        if instructor.valid?
            render json: instructor, status: :created
        else
            render json: {errors: instructor.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            head :no_content
        else
            render json: {errors: "Instructor not found"}, status: :not_found
        end
    end

    
end
