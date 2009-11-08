require "rubygems"
require "mixology"

mixin = Module.new { def foo; "foo from mixin"; end }
object = Class.new { def foo; "foo from object"; end }.new

object.mixin mixin
object.foo #=> "foo from mixin"

object.unmix mixin
object.foo #=> "foo from object"
