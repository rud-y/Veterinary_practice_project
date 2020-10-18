require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'de8u183vg97vi4', host: 'ec2-54-157-4-216.compute-1.amazonaws.com', port: 5432, user: 'mmladkvteqvqvj', password: '1250b038cede7a1f4f97bd48789842db857467d4deaa125222ce3c9736e62ed8'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end