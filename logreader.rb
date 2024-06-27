# reading the log file.
def readFile
  File.open("./web-server.log")
end


# count the number of HTTP 200 errors in the log file.
def count200errors (file)
  sum = 0
  file.each do |line|
    sum += line.scan(/200.\d{3}/).count
  end
  puts "number of http 200 code errors is #{sum}"
  puts
end


# gives the list of all HTTP response codes in the log along with their count.
def httpresponses (file)
  responses = Hash.new
  file.each do |line|
    err_code = line.scan(/\s\d{3}\s/)[0]
    if responses[err_code]
        responses[err_code] += 1
    else
        responses[err_code] = 1
    end
  end
  iteratehash(responses)
end

# iterating the hash to get response code and count.
def iteratehash (responses)
  responses.each do |key, value|
    puts "Response code :#{key} has a count of #{value}"
  end
end

count200errors(readFile)
httpresponses(readFile)
