# MIT License
# 
# Copyright (c) 2019 Grant Birchmeier
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

module DropInColorizer
  class Dic
    @enabled = true # this is a _class_ instance variable

    def self.enabled?
      @enabled
    end

    def self.disable
      @enabled = false
    end

    def self.enable
      @enabled = true
    end

    def initialize(str)
      @str = str

      @bold = false # 1
      @dim = false  # 2
      @underline = false # 4
      @blink = false # 5
      @invert = false # 7
      @conceal = false # 8

      @colorcode = nil
      @bgcolorcode = nil
    end

    def err(str)
      puts "DropInColorizer error: #{str}"
    end

    def to_s
      return @str unless self.class.enabled?
      sb = StringIO.new
      sb << "\e[1m" if @bold
      sb << "\e[2m" if @dim
      sb << "\e[4m" if @underline
      sb << "\e[5m" if @blink
      sb << "\e[7m" if @invert
      sb << "\e[8m" if @conceal
      sb << "\e[#{@colorcode}m" unless @colorcode.nil?
      sb << "\e[#{@bgcolorcode}m" unless @bgcolorcode.nil?
      (sb.length < 1) ? @str : "#{sb.string}#{@str}\e[0m"
    end

    # rubocop:disable Style/SingleLineMethods, Layout/EmptyLineBetweenDefs, Style/Semicolon
    def bold;      @bold = true;      self; end
    def dim;       @dim = true;       self; end
    def underline; @underline = true; self; end
    def blink;     @blink = true;     self; end
    def invert;    @invert = true;    self; end
    def conceal;   @conceal = true;   self; end

    def black;   @colorcode = 30; self; end
    def red;     @colorcode = 31; self; end
    def green;   @colorcode = 32; self; end
    def yellow;  @colorcode = 33; self; end
    def blue;    @colorcode = 34; self; end
    def magenta; @colorcode = 35; self; end
    def cyan;    @colorcode = 36; self; end
    def white;   @colorcode = 37; self; end

    def bg_black;   @bgcolorcode = 40; self; end
    def bg_red;     @bgcolorcode = 41; self; end
    def bg_green;   @bgcolorcode = 42; self; end
    def bg_yellow;  @bgcolorcode = 43; self; end
    def bg_blue;    @bgcolorcode = 44; self; end
    def bg_magenta; @bgcolorcode = 45; self; end
    def bg_cyan;    @bgcolorcode = 46; self; end
    def bg_white;   @bgcolorcode = 47; self; end
    # rubocop:enable Style/SingleLineMethods, Layout/EmptyLineBetweenDefs, Style/Semicolon

  end
end
