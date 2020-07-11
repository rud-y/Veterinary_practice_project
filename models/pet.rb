
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



end