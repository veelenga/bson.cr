module BSON
  class Timestamp

    getter :time, :increment

    def initialize(@increment : Int32, @time : Time)
    end

    def self.from_bson(bson : IO)
      new(Int32.from_bson(bson), Time.epoch(Int32.from_bson(bson)))
    end

    def to_bson(bson : IO)
      increment.to_bson(bson)
      time.epoch.to_bson(bson) # Int32
    end

    def bson_size
      sizeof(Int32) + sizeof(Int32)
    end

  end
end