require 'utils'

require 'parts.memory'

log(LOG_LEVEL.DEBUG, "Starting!")

myMemory = memory:new(nil,"My memory", "data/memory.bin")
myMemory2 = memory:new(nil,"Second memory")

myMemory:initialize()