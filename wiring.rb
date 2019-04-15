module WiringOP
    # Raised when a value of IN pin is set or when OUT pin is asked for value
    class DirectionError < RuntimeError
    end

    class Pin
        def initialize config
            @pin = config[:pin]
            @direction = config[:direction]

            direction = ""

            case @direction
            when :in
                direction = "in"
            when :out
                direction = "out"
            else
                raise ArgumentError, "invalid direction (should be :in or :out)"
            end

            `gpio mode #{@pin} #{direction}`
        end

        def set_hi
            set '1'
        end

        def set_lo
            set '0'
        end

        def is_hi
            return get_value == '1'
        end
        
        def is_lo
            return get_value == '0'
        end

        def set value
            if @direction != :out then
                raise WiringOP::DirectionError, "you tried to set value of a IN pin"
            end

            `gpio write #{@pin} #{value}`
        end

        def get_value
            if @direction != :in then
                raise WiringOP::DirectionError, "you tried to get a value of a OUT pin"
            end

            `gpio read #{@pin}`
        end

        private :set, :get_value
    end

    def WiringOP.reset
        `gpio reset`
    end
end
