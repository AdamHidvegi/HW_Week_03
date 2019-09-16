require_relative("../db/sql_runner.rb")

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @funds = options['funds']
  end

# INSTANCE METHODS

# CREATE
  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first()
    @id = customer['id'].to_i()
  end

# DELETE
  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

# UPDATE
  def update()
    sql = "UPDATE customers
    SET (name, funds) = ($1, $2)
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

# TRICKY PART - JOIN METHOD
  def films()
    sql = "SELECT films.*
    FROM films
    INNER JOIN tickets ON tickets.film_id = films.id
    WHERE tickets.customer_id = $1"
    films = SqlRunner.run(sql, [@id])
    result = films.map {|film| Film.new(film)}
    return result
  end

# NUMBER OF TICKETS
  def how_many_tickets()
    sql = "SELECT films.*
    FROM films
    INNER JOIN tickets ON tickets.film_id = films.id
    WHERE tickets.customer_id = $1"
    films = SqlRunner.run(sql, [@id])
    result = films.map {|film| Film.new(film)}.length()
    return "Number of bought tickets: #{result}"
  end

# PAYING FOR A TICKET
  def paying_for_ticket()
    sql = "SELECT films.*
    FROM films
    INNER JOIN tickets ON tickets.film_id = films.id
    WHERE tickets.customer_id = $1"
    films = SqlRunner.run(sql, [@id])
    prices = films.map {|film| film['price'].to_i()}
    result = @funds - prices.sum
    return "Amount of money after buying tickets: #{result}"
  end

# CLASS METHODS

# READ ALL
  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

# DELETE ALL
def self.delete_all()
  sql = "DELETE FROM customers"
  result = SqlRunner.run(sql)
  return result
end

end
