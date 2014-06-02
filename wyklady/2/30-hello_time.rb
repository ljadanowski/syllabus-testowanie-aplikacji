# polecenia wykonujemy na konsoli IRB

t = Time.utc 2000, 12, 31, 23, 59, 59, 999999

t.utc?
t.zone
t.utc_offset

t.localtime # konwersja z UTC do lokalnej strefy czasowej

t.utc?
t.zone
t.getlocal.isdst # true/false: daylight savings time in winter
