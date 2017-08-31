def hello_world
    ARGV.each do |arg|
        p "Hello,#{arg}!"
    end
end

hello_world
