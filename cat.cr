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
    fh = File.open(path, "r")
    IO.copy(fh, STDOUT)

  rescue Errno
    puts "#{$0} #{path}: No such file or directory"
    exit_value = 1

  ensure
    fh && fh.close
  end
end

exit(exit_value)
