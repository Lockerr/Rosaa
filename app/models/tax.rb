class Tax < ActiveRecord::Base
  attr_accessible :region_id, :vehicle_id, :segment, :rate

  scope :segment, lambda { |segment|
    where('segment = ? and vehicle_id = "1"', segment).limit(1)
  }

  scope :segment_with_region, lambda { |segment, region|
    where('segment = ? and region_id = ? and vehicle_id = "1"', segment, region).limit(1)
  }

  scope :by_power_with_region, lambda { |power,region|
    where('min < ? and max >= ? and region_id = ?', power, power, region)
  }


end
