require_relative('../db/sql_runner')

class Appointment

    attr_reader :id
    attr_accessor :date, :time, :pet_id, :vet_id

    def initialize (options)
        @id = options['id'].to_i if options['id']
        @date = options['date']
        @time = options['time']
        @pet_id = options['pet_id'].to_i
        @vet_id = options['vet_id'].to_i
    end

    def date_string()
        date = Time.parse(@date)
        return date.strftime('%d/%m/%Y')
    end

    def time_string()
        time = Time.parse(@time)
        return time.strftime("%H:%M")
    end

    def save() 
        sql = "INSERT INTO appointments (date, time, pet_id, vet_id)
        VALUES ($1, $2, $3, $4) RETURNING id"
        values = [@date, @time, @pet_id, @vet_id]
        result = SqlRunner.run(sql, values).first
        @id = result['id'].to_i
    end


    def update() 
        sql = "UPDATE appointments SET (
            date,
            time,
            pet_id,
            vet_id) =
            ($1, $2, $3, $4) WHERE id = $5;"
        values = [@date, @time, @pet_id, @vet_id, @id]
        SqlRunner.run(sql,values)
    end

    def self.find_all
        sql = "SELECT * FROM appointments ORDER BY date ASC"
        appointments = SqlRunner.run(sql)
        result = appointments.map{|appointment| Appointment.new(appointment)}
        return result
    end

    def self.find(id)
        sql = "SELECT * FROM appointments WHERE id = $1"
        values = [id]
        appointment = SqlRunner.run(sql, values).first
        result = Appointment.new(appointment)
        return result
    end

    def delete()
        sql = "DELETE FROM appointments WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM appointments"
        SqlRunner.run(sql)
    end

    def pet()
        pet = Pet.find(pet_id)
        return pet
    end

    def vet()
        vet = Vet.find(vet_id)
        return vet
    end


    def is_past
        return Date.parse(@date) < Date.today()
    end
    
end
