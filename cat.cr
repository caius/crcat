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

  begin
    # stat = File::Stat.new(path)
    # if stat.socket?
      # Unix socket time

    #   sock = Socket.unix
    #   sock.connect Socket::UNIXAddress.new(path)
    #   IO.copy(sock, STDOUT)
    #
    # else
      # Read file from path

      File.open(path, "r") do |fh|
        IO.copy(fh, STDOUT)
      end

    # end
  rescue File::NotFoundError
    puts "cat: #{path}: No such file or directory"
    exit_value = 1
  end
end

exit(exit_value)
