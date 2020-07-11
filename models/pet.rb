
class Pet 

    attr_reader :id
    attr_accessor :name, :type, :date_of_birth, :treatment_notes, :vet_id

    def initialize (options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @date_of_birth = options['date_of_birth']
        @treatment_notes = options['treatment_notes']
        @vet_id = options['vet_id']
    end

    def save()
        sql = "INSERT INTO pets (name, date_of_birth, treatment_notes, vet_id)
        VALUES ($1, $2, $3, $4) RETURNING id"
        values = [@name, date_of_birth, @treatment_notes, @vet_id]
        result = SqlRunner.run(sql, values).first
        @id = result['id'].to_i
    end

    def update()
        sql = "UPDATE  pets SET (name, date_of_birth, treatment_notes, vet_id) 
        = ($1, $2, $3, $4) WHERE id = $5"
        values = [@name, @date_of_birth, @treatment_notes, @vet_id, @id]
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



end