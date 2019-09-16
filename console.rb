require_relative("models/ticket.rb")
require_relative("models/customer.rb")
require_relative("models/film.rb")
require_relative("models/screening.rb")

require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Screening.delete_all()
Ticket.delete_all()

# FILMS

film1 = Film.new({
  'title' => 'The Lord of the Rings: The Fellowship of the Ring',
  'price' => 10,
  })

film1.save()

film2 = Film.new({
  'title' => 'The Lord of the Rings: The Two Towers',
  'price' => 10
  })

film2.save()

film3 = Film.new({
  'title' => 'The Lord of the Rings: The Return of the King',
  'price' => 10
  })

film3.save()

film4 = Film.new({
  'title' => 'The Hobbit: An Unexpected Journey',
  'price' => 10
  })

film4.save()

film5 = Film.new({
  'title' => 'The Hobbit: The Desolation of Smaug',
  'price' => 10
  })

film5.save()

film6 = Film.new({
  'title' => 'The Hobbit: The Battle of the Five Armies',
  'price' => 10
  })

film6.save()

# CUSTOMERS

customer1 = Customer.new({
  'name' => 'John Ronald Reuel Tolkien',
  'funds' => 100
  })

customer1.save()

customer2 = Customer.new({
  'name' => 'Edith Bratt',
  'funds' => 100
  })

customer2.save()

customer3 = Customer.new({
  'name' => 'Cristopher Tolkien',
  'funds' => 50
  })

customer3.save()

customer4 = Customer.new({
  'name' => 'Priscilla Mary Anne Reuel Tolkien',
  'funds' => 50
  })

customer4.save()

# customer4.delete()

# SCREENING TIMES

time1 = Screening.new({
  'show_time' => '01/01/2020 15:00'
  })

time1.save()

time2 = Screening.new({
  'show_time' => '01/01/2020 18:30'
  })

time2.save()

time3 = Screening.new({
  'show_time' => '01/01/2020 22:00'
  })

time3.save()

time4 = Screening.new({
  'show_time' => '02/01/2020 15:00'
  })

time4.save()

time5 = Screening.new({
  'show_time' => '02/01/2020 18:30'
  })

time5.save()

time6 = Screening.new({
  'show_time' => '03/01/2020 22:00'
  })

time6.save()

# TICKETS

# FILM 1 TICKETS

ticket1 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer1.id,
  'screening_id' => time1.id
  })
ticket1.save()

ticket2 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer2.id,
  'screening_id' => time1.id
  })
ticket2.save()

ticket3 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer3.id,
  'screening_id' => time1.id
  })
ticket3.save()

ticket4 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer4.id,
  'screening_id' => time1.id
  })
ticket4.save()

# FILM 2 TICKETS

ticket5 = Ticket.new({
  'film_id' => film2.id,
  'customer_id' => customer1.id,
  'screening_id' => time2.id
  })
ticket5.save()

ticket6 = Ticket.new({
  'film_id' => film2.id,
  'customer_id' => customer2.id,
  'screening_id' => time2.id
  })
ticket6.save()

ticket7 = Ticket.new({
  'film_id' => film2.id,
  'customer_id' => customer3.id,
  'screening_id' => time2.id
  })
ticket7.save()

# FILM 3 TICKETS

ticket8 = Ticket.new({
  'film_id' => film3.id,
  'customer_id' => customer1.id,
  'screening_id' => time3.id
  })
ticket8.save()

ticket9 = Ticket.new({
  'film_id' => film3.id,
  'customer_id' => customer2.id,
  'screening_id' => time3.id
  })
ticket9.save()

# FILM 4 TICKETS

ticket10 = Ticket.new({
  'film_id' => film4.id,
  'customer_id' => customer1.id,
  'screening_id' => time4.id
  })
ticket10.save()

ticket11 = Ticket.new({
  'film_id' => film4.id,
  'customer_id' => customer2.id,
  'screening_id' => time4.id
  })
ticket11.save()

ticket12 = Ticket.new({
  'film_id' => film4.id,
  'customer_id' => customer3.id,
  'screening_id' => time4.id
  })
ticket12.save()

ticket13 = Ticket.new({
  'film_id' => film4.id,
  'customer_id' => customer4.id,
  'screening_id' => time4.id
  })
ticket13.save()

# FILM 5 TICKETS

ticket14 = Ticket.new({
  'film_id' => film5.id,
  'customer_id' => customer1.id,
  'screening_id' => time5.id
  })
ticket14.save()

ticket15 = Ticket.new({
  'film_id' => film5.id,
  'customer_id' => customer2.id,
  'screening_id' => time5.id
  })
ticket15.save()

ticket16 = Ticket.new({
  'film_id' => film5.id,
  'customer_id' => customer3.id,
  'screening_id' => time5.id
  })
ticket16.save()

# FILM 6 TICKETS

ticket17 = Ticket.new({
  'film_id' => film6.id,
  'customer_id' => customer1.id,
  'screening_id' => time6.id
  })
ticket17.save()

ticket18 = Ticket.new({
  'film_id' => film6.id,
  'customer_id' => customer2.id,
  'screening_id' => time6.id
  })
ticket18.save()

customers = Customer.all()
films = Film.all()
times = Screening.all()
tickets = Ticket.all()

# HOW MANY TICKETS CUSTOMERS HAVE

paid_tickets_customer1 = customer1.how_many_tickets()
paid_tickets_customer2 = customer2.how_many_tickets()
paid_tickets_customer3 = customer3.how_many_tickets()
paid_tickets_customer4 = customer4.how_many_tickets()

# HOW MANY CUSTOMERS PAID FOR A MOVIE

number_of_customers_film1 = film1.number_of_customers()
number_of_customers_film2 = film2.number_of_customers()
number_of_customers_film3 = film3.number_of_customers()
number_of_customers_film4 = film4.number_of_customers()
number_of_customers_film5 = film5.number_of_customers()
number_of_customers_film6 = film6.number_of_customers()

# PAYING FOR A TICKET

money_left_customer1 = customer1.paying_for_ticket()
money_left_customer2 = customer2.paying_for_ticket()
money_left_customer3 = customer3.paying_for_ticket()
money_left_customer4 = customer4.paying_for_ticket()

customer1.name = 'J.R.R. Tolkien'
customer1.update()

binding.pry
nil
