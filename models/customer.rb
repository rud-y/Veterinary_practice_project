require_relative('../db/sql_runner')
require_relative('./pet')

class Customer 

    attr_reader :id
    attr_accessor :first_name, :last_name, :phone_number, :e_mail

    def initialize (options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @phone_number = options['phone_number']
        @e_mail = options['e-mail']
    end

    def save()
        sql = "INSERT INTO customers (first_name, last_name, phone_number, e_mail)
        VALUES ($1, $2, $3, $4) RETURNING id"
        values = [@first_name, @last_name, @phone_number, @e_mail]
        result = SqlRunner.run(sql, values).first
        @id = result['id'].to_i
    end

    def update()
        sql = "UPDATE customers SET (first_name, last_name, phone_number, e_mail) = 
        ($1, $2, $3, $4) WHERE id = $5"
        values = [@first_name, @last_name, @phone_number, @e_mail, @id]
        SqlRunner.run(sql,values)
    end


    def Customer.find_all()
        sql = "SELECT * FROM customers"
        all_customers = SqlRunner.run(sql)
        result = all_customers.map{|customer| Customer.new(customer)}
        return result
    end

    def Customer.find(id)
        sql = "SELECT * from customers WHERE id = $1"
        values = [id]
        customer = SqlRunner.run(sql, values).first
        result = Customer.new(customer)
        return result
    end

    def delete()
        sql = "DELETE FROM customers WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM customers"
        SqlRunner.run(sql)
    end

    # def pets()###
    #     sql = "SELECT pets.* FROM pets
    #     WHERE customer_id = $1"
    #     values(@id)
    #     result = SqlRunner.run(sql, values)
    #     pets = result.map{|pet| Pet.new(pet)}
    #     return pets
    # end

end