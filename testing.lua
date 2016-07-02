require 'lib.globals'
require 'utils'

require 'parts.memory'

log(LOG_LEVEL.DEBUG, "Starting!")

myMemory = memory:new("My memory")
myMemory2 = memory:new("Second memory")