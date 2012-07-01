# Copy output to clipboard
def copy(*args) IO.popen('pbcopy', 'r+') { |clipboard| clipboard.puts args.map(&:inspect) }; end

# Pipe to less
def less(x)
  IO.popen( 'less -', 'w') do |io|
    io.puts x.to_yaml
  end
end
