require_relative("../db/sql_runner.rb")

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @price = options['price']
    @id = options['id'].to_i() if options['id']
  end

# INSTANCE METHODS

# CREATE
  def save()
    sql = "INSERT INTO films (title, price)
    VALUES ($1, $2)
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first()
    @id = film['id'].to_i
  end

# DELETE
  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

# UPDATE
  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

# TRICKY PART - JOIN METHOD
  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = $1"
    customers = SqlRunner.run(sql, [@id])
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

# FILM'S SHOW TIME
  def screenings()
    sql = "SELECT screenings.* FROM screenings INNER JOIN tickets ON tickets.screening_id = screenings.id WHERE tickets.film_id = $1"
    screenings = SqlRunner.run(sql, [@id])
    result = screenings.map {|screening| screening['show_time']}.first()
    return "This movie is going to be on screen: #{result}"
  end

# NUMBER OR CUSTOMERS FOR A MOVIE
def number_of_customers()
  sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = $1"
  customers = SqlRunner.run(sql, [@id])
  result = customers.map{|customer| Customer.new(customer)}.length()
  return "The number of customers who paid for a ticket: #{result}"
end

# CLASS METHODS

# READ ALL
  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end

# DELETE ALL
  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end
