require "socket"

if ARGV.empty?
  inputs = ["-"]
else
  inputs = ARGV.dup
end

exit_value = 0

inputs.each do |path|
  if path == "-"
    path = "/dev/stdin"
  end

  case File.info(ARGV.first).type
  when File::Type::Socket
    sock = UNIXSocket.new(path)
    IO.copy(sock, STDOUT)

  when File::Type::File
    begin
      File.open(path, "r") do |fh|
        IO.copy(fh, STDOUT)
      end
    rescue File::NotFoundError
      puts "cat: #{path}: No such file or directory"
      exit_value = 1
    end

  else
    puts "cat: #{path}: No such file or directory"
    exit_value = 1
  end
end

exit(exit_value)
