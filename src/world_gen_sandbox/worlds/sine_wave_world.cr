require "world_gen"
require "world_gen/render/stumpy_png/png_render"

require "../passes/sine_wave"
require "../passes/debug_color"


class SineWaveWorld < World
  include PNGRender

  def initialize(x_range, y_range, z_range)
    super x_range, y_range, z_range
    assets.open_content "../content/basic/big/"
  end
  
  protected def make_passes
    pass = Pass.new
    passes << pass

    pass.define_block(:type) do |_, x, y, z|
      SineWave.get_type(x, y, z, x_range, y_range, z_range)
    end

    pass.define_block(:color) do |_, x, y, z|
      DebugColor.get_color(x, y, z, x_range, y_range, z_range)
    end
  end
end
