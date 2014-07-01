class Timer
  attr_accessor :time, :limit

  def initialize(limit)
    self.limit = limit
    reset
  end

  def update(component, delta_state)
    if time > limit
      yield component, delta_state
      reset
    else
      add_time delta_state.delta
    end
  end

  def reset
    self.time = 0.0
  end

  def add_time(a_time)
    self.time = time + a_time
  end
end