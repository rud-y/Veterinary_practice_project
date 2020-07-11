
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

    

end