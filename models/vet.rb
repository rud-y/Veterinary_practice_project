require_relative('../db/sql_runner')

class Vet 

    attr_reader :id
    attr_accessor :first_name, :last_name, :phone_number, :e_mail

    def initialize (options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @phone_number = options['phone_number']
        @e_mail = options['e_mail']
    end

    def save()
        sql = "INSERT INTO vets (first_name, last_name, phone_number, e_mail)
        VALUES ($1, $2, $3, $4) RETURNING id"
        values = [@first_name, @last_name, @phone_number, @e_mail]
        result = SqlRunner.run(sql, values).first
        @id = result['id'].to_i
    end

    def update()
        sql = "UPDATE vets SET (first_name, last_name, phone_number, e_mail) = 
        ($1, $2, $3, $4) WHERE id = $5"
        values = [@first_name, @last_name, @phone_number, @e_mail, @id]
        SqlRunner.run(sql,values)
    end


    def Vet.find_all()
        sql = "SELECT * FROM vets"
        all_vets = SqlRunner.run(sql)
        result = all_vets.map{|vet| Vet.new(vet)}
        return result
    end

    def Vet.find(id)
        sql = "SELECT * from vets WHERE id = $1"
        values = [id]
        vet = SqlRunner.run(sql, values).first
        result = Vet.new(vet)
        return result
    end

    def delete()
        sql = "DELETE FROM vets WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM vets"
        SqlRunner.run(sql)
    end

    def pets()
        sql = "SELECT pets.* FROM pets WHERE vet_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        pets = result.map {|pet| Pet.new(pet)}
        return pets
    end

    def pet_count()
        return pets().count
    end

    def appointments()
        sql = "SELECT * FROM appointments WHERE vet_id = $1;"
        values = [@id]
        result = SqlRunner.run(sql,values)
        appointments = result.map{ |appointment| Appointment.new(appointment)}
        return appointments
    end

end