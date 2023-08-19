class MapService
  def self.create(map_params)
    map = Map.new(map_params)
    map.set_signature
    map.save
    map
  end

  def self.update(map, map_params)
    new_map = Map.new(map_params.except(:background, :foreground, :collision_mask))
    new_map.set_signature(map.signature)

    image_params.map do |type|
      attach(new_map, map, map_params, type)
    end
    
    new_map.save
    new_map
  end

  private

  def self.attach(new_map, map, map_params, type)
    if map_params[:background].present?
      new_map.background.attach(map_params[:background])
    else
      new_map.background = map.background.blob
    end

    if map_params[:foreground].present?
      new_map.foreground.attach(map_params[:foreground])
    else
      new_map.foreground = map.foreground.blob
    end

    if map_params[:collision_mask].present?
      new_map.collision_mask.attach(map_params[:collision_mask])
    else
      new_map.collision_mask = map.collision_mask.blob
    end
  end

  def self.image_params
    %i[ background foreground collision_mask]
  end
end