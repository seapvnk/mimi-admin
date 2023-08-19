class WorldService
  def self.create(world_params)
    world = World.new(world_params)
    world.set_signature
    world
  end

  def self.update(map, world_params)
    new_world = World.new(world_params)
    new_world.set_signature(world.signature)
    new_world.save
    new_world
  end
end