require_relative("../db/sql_runner.rb")

class Screening

  attr_reader :id
  attr_accessor :show_time

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @show_time = options['show_time']
  end

# INSTANCE METHODS

# CREATE
  def save()
    sql = "INSERT INTO screenings (show_time) VALUES ($1)
    RETURNING id"
    values = [@show_time]
    screening = SqlRunner.run(sql, values).first()
    @id = screening['id'].to_i()
  end

# DELETE
  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

# UPDATE
  def update()
    sql = "UPDATE screenings
    SET show_time = $1
    WHERE id = $2"
    values = [@show_time, @id]
    SqlRunner.run(sql, values)
  end

# CLASS METHODS

# READ ALL
  def self.all()
    sql = "SELECT * FROM screenings"
    times = SqlRunner.run(sql)
    result = times.map {|time| Screening.new(time)}
    return result
  end

# DELETE ALL
  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

end
