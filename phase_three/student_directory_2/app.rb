require_relative './lib/cohort_repository'
require_relative './lib/database_connection'

class Application
  def run
    DatabaseConnection.connect('student_directory_test')

    cohort_repo = CohortRepository.new
    cohort = cohort_repo.find_with_students(1)
    
    puts "#{cohort.name} - #{cohort.starting_date}"
    puts "Students:"
    students = cohort.students
    students.each do |student|
      puts "#{student.id} - #{student.name}"
    end
  end
end

app = Application.new
app.run