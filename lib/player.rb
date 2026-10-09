class Player
    attr_reader :name, :marker

    def initialize(name, marker)
        @name = name
        @marker = marker
    end

    def to_s
        "#{@name} (#{@marker})"
    end
end
