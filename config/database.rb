##
# A MySQL connection:
# DataMapper.setup(:default, 'mysql://user:password@localhost/the_database_name')
#
# # A Postgres connection:
#DataMapper.setup(:default, 'postgres://piermariacosina@localhost/the_database_name')
#
# # A Sqlite3 connection
# DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "development.db"))
#

DataMapper.logger = logger
DataMapper::Property::String.length(255)

case Padrino.env
  when :development then DataMapper.setup(:default, "postgres://piermariacosina@localhost/localactors_development")
  when :production then DataMapper.setup(:default, ENV["DATABASE_URL"])
  when :staging then DataMapper.setup(:default, ENV["DATABASE_URL"])
  when :staging  then DataMapper.auto_upgrade!
  when :production  then DataMapper.auto_upgrade!
  when :test        then DataMapper.setup(:default, "postgres://piermariacosina/localactors_test")
end
