require_relative('../db/sql_runner')

class Pet 

    attr_reader :id
    attr_accessor :name, :type, :date_of_birth, :vet_id, :customer_id, :treatment_notes

    def initialize (options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @type = options['type']
        @date_of_birth = options['date_of_birth']
        @customer_id = options['customer_id'].to_i
        @vet_id = options['vet_id'].to_i
        @treatment_notes = options['treatment_notes']
    end

    def save()
        sql = "INSERT INTO pets (name, type, date_of_birth, customer_id, vet_id, treatment_notes)
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
        values = [@name, @type, @date_of_birth, @customer_id, @vet_id, @treatment_notes]
        result = SqlRunner.run(sql, values).first
        @id = result['id'].to_i
    end

    def update()
        sql = "UPDATE  pets SET (treatment_notes, vet_id) 
        = ($1, $2) WHERE id = $3"
        values = [@treatment_notes, @vet_id, @id]
        SqlRunner.run(sql, values)
    end

    def Pet.find_all()
        sql = "SELECT * from pets"
        all_pets = SqlRunner.run(sql)
        result = all_pets.map {|pet| Pet.new(pet)}
        return result
    end

    def Pet.find(id)
        sql = "SELECT * from pets WHERE id = $1"
        values = [id]
        pet = SqlRunner.run(sql, values).first
        result = Pet.new(pet)
        return result
    end

    def delete()
        sql = "DELETE FROM pets WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def Pet.delete_all()
        sql = "DELETE  FROM  pets"
        SqlRunner.run(sql)
    end

    def customer()
        customer = Customer.find(@customer_id)
        return customer
    end

    def vet()
        vet = Vet.find(@vet_id)
        return vet
    end

end
