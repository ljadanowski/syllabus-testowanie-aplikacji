# polecenia wykonujemy na konsoli IRB

require 'date'

t = Time.utc 2000, 12, 31, 23, 59, 59, 999999

Date.parse "2000-12-31 23:59:59 UTC"

Date._parse "2000-12-31 23:59:59 UTC" # =>{:zone=>"UTC", :hour=>23, :min=>59, :sec=>59, :year=>2000, :mon=>12, :mday=>31, :offset=>0}
Date._iso8601 "2000-12-31T23:59:59"   # =>{:mday=>31, :year=>2000, :mon=>12, :hour=>23, :min=>59, :sec=>59}
