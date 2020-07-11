require_relative('../db/sql_runner')
class Vet 

    attr_reader :id
    attr_accessor :first_name, :last_name, :phone_number

    def initialize (options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @phone_number = options['phone_number']
    end

    def save()
        sql = "INSERT INTO vets (first_name, last_name, phone_number)
        VALUES ($1, $2, $3) RETURNING id"
        values = [@first_name, @last_name, @phone_number]
        result = SqlRunner.run(sql, values).first
        @id = result['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM vets"
        SqlRunner.run(sql)
    end
end