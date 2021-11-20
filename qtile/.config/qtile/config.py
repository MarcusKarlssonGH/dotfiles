# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import subprocess

@hook.subscribe.screen_change
def set_screens(event):
    subprocess.run(["autorandr", "--change"])
    qtile.restart()

# When application launched automatically focus it's group
@hook.subscribe.client_new
def modify_window(client):
    for group in groups:  # follow on auto-move
        match = next((m for m in group.matches if m.compare(client)), None)
        if match:
            targetgroup = client.qtile.groups_map[group.name]  # there can be multiple instances of a group
            targetgroup.cmd_toscreen(toggle=False)
            break

# # Hook to fallback to the first group with windows when last window of group is killed
# @hook.subscribe.client_killed
# def fallback(window):
#     if window.group.windows != [window]:
#         return
#     idx = qtile.groups.index(window.group)
#     for group in qtile.groups[idx - 1::-1]:
#         if group.windows:
#             qtile.current_screen.toggle_group(group)
#             return
#     qtile.current_screen.toggle_group(qtile.groups[0])

mod = "mod4" # Super/windows
alt = "mod1"

my_terminal = guess_terminal()
my_browser = "firefox"  # My terminal of choice

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "m", lazy.window.toggle_fullscreen(), desc="Fullscreen toogle"),
    Key([alt], "Tab", lazy.group.next_window(), desc="Focus previous window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(my_terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(my_browser), desc="Launch " + my_browser),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # My additions
    Key([mod, "shift"], "Return",
        lazy.spawn("dmenu_run -p 'Run: '"),
        desc='Run Launcher'
        ),

    # Multi-Screen Focus
    Key([mod], "comma", lazy.prev_screen(), desc="Focus the prev screen"),
    Key([mod], "period", lazy.next_screen(), desc="Focus the next screen"),
]


groups = [
    Group("web", layout="max", matches=[
          Match(wm_class=["Firefox"])]),
    Group("terminal", layout="monadtall", matches=[
          Match(wm_class=["Gnome-terminal"])]),
    Group("dev", layout="max", matches=[
          Match(wm_class=["Code"])]),
    Group("games", layout="floating", matches=[
          Match(wm_class=["Steam", "Dota", "Dota2"])]),
    Group("other", layout="monadtall"),
]

for idx, g in enumerate(groups):
    group_key = str(idx + 1)
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], group_key, lazy.group[g.name].toscreen(),
            desc=f"Switch to group {g.name}"),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], group_key, lazy.window.togroup(g.name, switch_group=True),
            desc=f"Switch to & move focused window to group {g.name}"),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

colors = {"black": "#080808",  # Background
          "white": "#FFFFFF",  # Foreground
          "grey": "#ABB2BF",  # Grey Colour
          "red": "#E35374",
          "green": "#89CA78",
          "yellow": "#F0C674",
          "blue": "#61AFEF",
          "purple": "#D55FDE",
          "teal": "#2BBAC5"}

layout_theme = {"border_width": 3,
        "margin": 6,
        "border_focus": colors["teal"],
        "border_normal": colors["black"]
        }
layouts = [
    # layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    layout.Columns(**layout_theme, single_border_width=0),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    # layout.Floating(),
]

# TODO: can this just be a single list? (should be dict/enum of colors)
colours = [["#080808", "#080808"],  # Background
           ["#FFFFFF", "#FFFFFF"],  # Foreground
           ["#ABB2BF", "#ABB2BF"],  # Grey Colour
           ["#E35374", "#E35374"],
           ["#89CA78", "#89CA78"],
           ["#F0C674", "#F0C674"],
           ["#61AFEF", "#61AFEF"],
           ["#D55FDE", "#D55FDE"],
           ["#2BBAC5", "#2BBAC5"]]




widget_defaults = dict(
    background=colors["black"],
    foreground=colors["white"],
    font="SF Pro Text Regular",
    fontsize=12,
    padding=1,
)

extension_defaults = widget_defaults.copy()


@lazy.function
def z_next_keyboard(qtile):
    keyboard_widget.cmd_next_keyboard()


keyboard_widget = widget.KeyboardLayout(
    configured_keyboards=['us', 'se'],
    foreground=colors["blue"],
    font="SF Pro Text Semibold",
)
# separator = widget.Sep(foreground=colours[2],
separator = widget.Sep(foreground=colors["grey"],
                       linewidth=1,
                       padding=10)


my_widgets = [
    widget.GroupBox(
        active=colors["green"],
        inactive=colors["blue"],
        other_current_screen_border=colors["yellow"],
        other_screen_border=colors["grey"],
        this_current_screen_border=colors["purple"],
        this_screen_border=colors["grey"],
        urgent_border=colors["red"],
        urgent_text=colors["red"],
        disable_drag=True,
        highlight_method="text",
        invert_mouse_wheel=True,
        margin=2,
        padding=0,
        rounded=True,
        urgent_alert_method="text",
    ),
    separator,
    widget.CurrentLayout(
        foreground=colors["teal"],
        font="SF Pro Text Semibold",
    ),
    separator,
    widget.WindowName(
        max_chars=75,
    ),
    widget.CPU(
        foreground=colors["blue"],
        format="CPU {load_percent}% ",
        # mouse_callbacks={
        #     "Button1": lambda: qtile.cmd_spawn(my_terminal + " -e ytop")},
        update_interval=1.0,
    ),
    widget.Memory(
        foreground=colors["purple"],
        format="RAM {MemUsed:.0f} SWP {SwapUsed:.0f}",
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn(my_terminal + " -e 'htop -C'")},
        update_interval=1.0,
    ),
    separator,
    widget.PulseVolume(
        foreground=colors["blue"],
        update_interval=0.1,
        volume_app="pavucontrol",
        step=5,
    ),
    separator,
    # widget.Systray(icon_size=24, padding=4), 
    # widget.KeyboardLayout(),
    keyboard_widget,
    separator,
    widget.Clock(
        foreground=colors["teal"],
        format="%a %b %d  %H:%M   ",
    ),
]

keys.append(Key(["mod4"], "space", z_next_keyboard))

screens = [
    Screen(top=bar.Bar(my_widgets, 24, opacity=1.0), wallpaper="/home/marcus/Pictures/Wallpapers/dota2.jpg"),
    # Screen(top=bar.Bar(my_widgets, 24, opacity=1.0), wallpaper="/home/marcus/Pictures/Wallpapers/dota2.jpg"),
    Screen(top=bar.Bar(my_widgets[:4], 24, opacity=1.0), wallpaper="/home/marcus/Pictures/Wallpapers/dota2.jpg"),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
