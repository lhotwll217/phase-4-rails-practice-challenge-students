class StudentsController < ApplicationController
    wrap_parameters format: []

    def index
        students = Student.all
        if students
            render json: students
        else
            render json: {errors: "students not found"}, status: :not_found
        end
    end


    def show
        student = Student.find_by(id: params[:id])
        if student
                render json: student
        else
                render json: {errors: "student not found"}, status: :not_found
        end
    end

    def create
        student = Student.create(student_params)
        if student.valid?
            render json: student, status: :created
        else
            render json: {errors: student.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        student = Student.find_by(id: params[:id])
        if student
            student.destroy
            head :no_content
        else
            render json: {errors: "student not found"}, status: :not_found
        end
    end

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end
    
end
