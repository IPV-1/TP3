package map;

import org.jruby.Ruby;
import org.jruby.RubyObject;
import org.jruby.runtime.Helpers;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.javasupport.JavaUtil;
import org.jruby.RubyClass;


public class ColorParser extends RubyObject  {
    private static final Ruby __ruby__ = Ruby.getGlobalRuntime();
    private static final RubyClass __metaclass__;

    static {
        String source = new StringBuilder("require 'java'\n" +
            "\n" +
            "java_import Java::resource.Resource\n" +
            "java_import Java::javax.imageio.ImageIO\n" +
            "java_import Java::java.awt.image.BufferedImage\n" +
            "java_import Java::com.uqbar.vainilla.appearances.Sprite\n" +
            "java_import Java::java.awt.Color\n" +
            "\n" +
            "class ColorParser\n" +
            "  attr_accessor :walking_matrix, :background\n" +
            "\n" +
            "  #Remove this!\n" +
            "  BLOCK_SIZE = 30\n" +
            "\n" +
            "  def initialize\n" +
            "    self.walking_matrix = []\n" +
            "  end\n" +
            "\n" +
            "  def parse(file)\n" +
            "    create_walking_matrix(file)\n" +
            "    create_background(file)\n" +
            "  end\n" +
            "\n" +
            "  def get_walking_matrix\n" +
            "    self.walking_matrix\n" +
            "  end\n" +
            "\n" +
            "  def get_background\n" +
            "    self.background\n" +
            "  end\n" +
            "\n" +
            "  def create_background(file)\n" +
            "    read_image(file) do |image,width, height|\n" +
            "      new_image = BufferedImage.new width * BLOCK_SIZE, height * BLOCK_SIZE, BufferedImage::TYPE_INT_ARGB\n" +
            "      graphics = new_image.createGraphics\n" +
            "      (0...height).each do |row_number|\n" +
            "        create_image_row(row_number, width, image, graphics)\n" +
            "      end\n" +
            "      graphics.dispose\n" +
            "      self.background = Sprite.new new_image\n" +
            "    end\n" +
            "  end\n" +
            "\n" +
            "  def create_walking_matrix(file)\n" +
            "    read_image(file) do |image,w, h|\n" +
            "      (0...h).each do |i|\n" +
            "        create_row(i, w, image)\n" +
            "      end\n" +
            "    end\n" +
            "  end\n" +
            "\n" +
            "  def read_image(file)\n" +
            "    stream = Resource.java_class.resource file\n" +
            "    image = ImageIO.read stream\n" +
            "    w = image.width\n" +
            "    h = image.height\n" +
            "    yield image, w, h\n" +
            "  end\n" +
            "\n" +
            "  private\n" +
            "\n" +
            "  def create_image_row(row_number, width, image, graphics)\n" +
            "    (0...width).each do |column_number|\n" +
            "      pixel = image.getRGB(column_number, row_number)\n" +
            "      g_image = image_for(pixel, image)\n" +
            "      graphics.draw_image(g_image, nil, column_number* BLOCK_SIZE, row_number * BLOCK_SIZE)\n" +
            "    end\n" +
            "  end\n" +
            "\n" +
            "  def create_row(i, width, image)\n" +
            "    row = []\n" +
            "    (0...width).each do |j|\n" +
            "      pixel = image.getRGB(j, i)\n" +
            "      row << boolean_for(pixel)\n" +
            "    end\n" +
            "    add_row row\n" +
            "  end\n" +
            "\n" +
            "  def add_row(row)\n" +
            "    walking_matrix << row\n" +
            "  end\n" +
            "\n" +
            "\n" +
            "  def boolean_for(color)\n" +
            "    color == -324853\n" +
            "  end\n" +
            "\n" +
            "  def image_for(color, image)\n" +
            "    new_image = BufferedImage.new BLOCK_SIZE, BLOCK_SIZE, BufferedImage::TYPE_INT_ARGB\n" +
            "    graphics = new_image.createGraphics\n" +
            "    graphics.color = (color == -324853 ? Color::RED : Color::BLUE)\n" +
            "    graphics.fill_rect( 0, 0, BLOCK_SIZE, BLOCK_SIZE)\n" +
            "    graphics.dispose\n" +
            "    new_image\n" +
            "  end\n" +
            "end").toString();
        __ruby__.executeScript(source, "color_parser.rb");
        RubyClass metaclass = __ruby__.getClass("ColorParser");
        if (metaclass == null) throw new NoClassDefFoundError("Could not load Ruby class: ColorParser");
        metaclass.setRubyStaticAllocator(ColorParser.class);
        __metaclass__ = metaclass;
    }

    /**
     * Standard Ruby object constructor, for construction-from-Ruby purposes.
     * Generally not for user consumption.
     *
     * @param ruby The JRuby instance this object will belong to
     * @param metaclass The RubyClass representing the Ruby class of this object
     */
    private ColorParser(Ruby ruby, RubyClass metaclass) {
        super(ruby, metaclass);
    }

    /**
     * A static method used by JRuby for allocating instances of this object
     * from Ruby. Generally not for user comsumption.
     *
     * @param ruby The JRuby instance this object will belong to
     * @param metaclass The RubyClass representing the Ruby class of this object
     */
    public static IRubyObject __allocate__(Ruby ruby, RubyClass metaClass) {
        return new ColorParser(ruby, metaClass);
    }

    
    public  ColorParser() {
        this(__ruby__, __metaclass__);

        Helpers.invoke(__ruby__.getCurrentContext(), this, "initialize");

    }

    
    public Object parse(Object file) {
        IRubyObject ruby_arg_file = JavaUtil.convertJavaToRuby(__ruby__, file);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "parse", ruby_arg_file);
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object get_walking_matrix() {

        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "get_walking_matrix");
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object get_background() {

        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "get_background");
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object create_background(Object file) {
        IRubyObject ruby_arg_file = JavaUtil.convertJavaToRuby(__ruby__, file);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "create_background", ruby_arg_file);
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object create_walking_matrix(Object file) {
        IRubyObject ruby_arg_file = JavaUtil.convertJavaToRuby(__ruby__, file);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "create_walking_matrix", ruby_arg_file);
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object read_image(Object file) {
        IRubyObject ruby_arg_file = JavaUtil.convertJavaToRuby(__ruby__, file);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "read_image", ruby_arg_file);
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object create_image_row(Object row_number, Object width, Object image, Object graphics) {
        IRubyObject ruby_args[] = new IRubyObject[4];
        ruby_args[0] = JavaUtil.convertJavaToRuby(__ruby__, row_number);
        ruby_args[1] = JavaUtil.convertJavaToRuby(__ruby__, width);
        ruby_args[2] = JavaUtil.convertJavaToRuby(__ruby__, image);
        ruby_args[3] = JavaUtil.convertJavaToRuby(__ruby__, graphics);

        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "create_image_row", ruby_args);
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object create_row(Object i, Object width, Object image) {
        IRubyObject ruby_arg_i = JavaUtil.convertJavaToRuby(__ruby__, i);
        IRubyObject ruby_arg_width = JavaUtil.convertJavaToRuby(__ruby__, width);
        IRubyObject ruby_arg_image = JavaUtil.convertJavaToRuby(__ruby__, image);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "create_row", ruby_arg_i, ruby_arg_width, ruby_arg_image);
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object add_row(Object row) {
        IRubyObject ruby_arg_row = JavaUtil.convertJavaToRuby(__ruby__, row);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "add_row", ruby_arg_row);
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object boolean_for(Object color) {
        IRubyObject ruby_arg_color = JavaUtil.convertJavaToRuby(__ruby__, color);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "boolean_for", ruby_arg_color);
        return (Object)ruby_result.toJava(Object.class);

    }

    
    public Object image_for(Object color, Object image) {
        IRubyObject ruby_arg_color = JavaUtil.convertJavaToRuby(__ruby__, color);
        IRubyObject ruby_arg_image = JavaUtil.convertJavaToRuby(__ruby__, image);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "image_for", ruby_arg_color, ruby_arg_image);
        return (Object)ruby_result.toJava(Object.class);

    }

}
