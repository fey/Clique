--[[---------------------------------------------------------------------------------
  This is a template for the plugin/module system for Clique.

  Plugins are typically used to tie Clique to a specific set of unit frames, but
  can also be used to add functionality to the system through a manner of hooks.

  Plugins are registered with Clique with a shortname that is used for all slash
  commands.  In addition they are required to have a fullname parameter that is
  used in all display messages
----------------------------------------------------------------------------------]]

-- Create a new plugin for Clique, with the shortname "luna"
local Plugin = Clique:NewModule("luna")
Plugin.fullname = "Luna Unit Frames"

-- Plugin:Test() is called anytime the mod tries to enable.  It is optional
-- but it will be checked if it exists.  Will typically be based off some global
-- or the state of the addon itself.  LunaUF is Luna's global main table
-- (LunaUnitFrames.lua:1).
function Plugin:Test()
    return LunaUF and true or false
end

-- Plugin:OnEnable() is called if Plugin:Test() is true, and the mod hasn't been explicitly
-- disabled.  This is where you should handle all your hooks, etc.
function Plugin:OnEnable()
    Luna_Custom_ClickFunction = self.OnClick
end

-- Plugin:OnDisable() is called if the mod is enabled and its being explicitly disabled.
-- This function is optional.  If it doesn't exist, Plugin:UnregisterAllEvents() and
-- Plugin:UnregisterAllHooks().
function Plugin:OnDisable()
    Luna_Custom_ClickFunction = nil
end

-- Below this line begins any custom code to make the plugin work.
-- Luna calls Luna_Custom_ClickFunction(button, this.unit) with no "self", so this
-- is a plain function.  The return value is passed straight back to Luna: truthy
-- means Clique handled the click and Luna skips its own clickcasting; nil means
-- Luna falls through to its built-in bindings.
function Plugin.OnClick(button, unit)
    return Clique:OnClick(button, unit)
end
