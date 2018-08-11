require "csv"

CSV.foreach("db/seeds/csv/tag.csv", headers: true) do |row|
  Tag.create(name: row[0])
end
