require 'cohort_repository'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_test' })
  connection.exec(seed_sql)
end

RSpec.describe CohortRepository do
  before(:each) do
    reset_tables
  end

  it 'finds cohort 1 with related students' do
    repository = CohortRepository.new
    cohort = repository.find_with_students(1)

    expect(cohort.name).to eq 'Jan 2023'
    expect(cohort.students.length).to eq 2
  end
end
