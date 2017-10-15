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
    File.open(path, "r") do |fh|
      IO.copy(fh, STDOUT)
    end

  rescue Errno
    puts "#{$0} #{path}: No such file or directory"
    exit_value = 1
  end
end

exit(exit_value)
