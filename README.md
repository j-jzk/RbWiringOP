# RbWiringOP
Ruby library for easier use of [zhaolei's WiringOP](https://github.com/zhaolei/WiringOP). 
It simplifies calling the shell commands and adds a nice Ruby interface.

## Installation
First download and install the WiringOP.
```
git clone https://github.com/zhaolei/WiringOP.git -b h3 
cd WiringOP
chmod +x ./build
sudo ./build
```
*(from WiringOP readme)*

Then clone this repository:
```
git clone https://github.com/j-jzk/RbWiringOP.git
```

## Usage
```ruby
require './RbWiringOP/wiring.rb'

# reset the gpio (not required)
WiringOP.reset

my_pin = WiringOP::Pin.new :pin => 0, :direction => :out  # the library uses WiringPi pin numbering

# do something with the pin
my_pin.set_hi
my_pin.set_lo

# an input pin
another_pin = WiringOP::Pin.new :pin => 4, :direction => :in

# check the value
if another_pin.is_hi
    # do something
end
# or
if another_pin.is_lo
    # do something
end
```
