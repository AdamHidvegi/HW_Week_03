require_relative("../db/sql_runner.rb")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :screening_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
    @screening_id = options['screening_id']
  end

# INSTANCE METHODS

# CREATE
  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, screening_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@customer_id, @film_id, @screening_id]
    ticket = SqlRunner.run(sql, values).first()
    @id = ticket['id'].to_i()
  end

# DELETE
  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

# UPDATE
  def update()
    sql = "UPDATE tickets SET (customer_id, film_id, screening_id) = ($1, $2, $3) WHERE id = $4"
    SqlRunner.run(sql, [@id])
  end

# TRICKY PART - JOIN METHODS
  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    customer = SqlRunner.run(sql, [@customer_id]).first
    return Customer.new(customer)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    film = SqlRunner.run(sql, [@film_id]).first
    return Film.new(film)
  end

  def show_time()
    sql = "SELECT * FROM screenings WHERE id = $1"
    time = SqlRunner.run(sql, [@screening_id]).first
    return Screening.new(film)
  end

# CLASS METHODS

# READ ALL
  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket| Ticket.new(ticket)}
  end

# DELETE ALL
  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
