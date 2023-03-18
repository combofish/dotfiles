-- vim: ts=4 sw=4 noet ai cindent syntax=lua

conky.config = {
   alignment = 'top_right',
   background = true,
   border_width = 0.5,   
   --   border_margin = 0,

   net_avg_samples = 2,
   cpu_avg_samples = 4,
   --   font = 'DejaVu Sans Mono:size=8',

   --   default_color = 'white',
   --   default_outline_color = 'grey',
   --   default_shade_color = 'black',
   draw_borders = true,
   
   draw_graph_borders = true,
   draw_outline = false,
   draw_shades = false,
   use_xft = true,

   own_window = true,
   own_window_type = 'override',
   own_window_transparent = true,
   out_to_console = false,
   --  out_to_stderr = false,
   --  extra_newline = false,
   --  own_window_colour = '000000',
   --  own_window_class = 'Conky',
   --  own_window_argb_visual = true,
   --  own_window_argb_count = 0,
   own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
   
   double_buffer = true,

   stippled_borders = 0,

   show_graph_scale = false,
   show_graph_range = false,

   gap_x = 5,
   gap_y = 35,
   minimum_height = 5,
   minimum_width = 5,

   --   no_buffers = false,
   update_interval = 1.0,
   uppercase = false,
   use_spacer = 'none'
   --   override_utf8_locale = true,
}

conky.text = [[
${font Latin Modern Mono Caps:bold:size=14}${alignc}${color 00ffae}combofish${font}

${font Noto Sans:bold:size=18}${alignc}${desktop_name} ${alignr}${desktop}/$desktop_number${font}

${font Entopia:bold:size=12}${color 33E9FF}PERFORMANCE ${hr 2}${font}
${offset 8}${color FFFDE2}Uptime:${alignr}$color $uptime
${offset 8}CPU: ${freq dyn} MHz ${alignr}Temp: ${acpitemp}°C
${offset 8}${font}${color FFFDE2}Procs:$color $processes ${alignr}${color FFFDE2}Run:$color $running_processes 

${font Entopia:bold:size=12}${color green}NETWORK  ${hr 2}${font DejaVu Sans Mono:size=9}${color}
${offset 12}${font Entopia:bold:size=10}${color orange}${wireless_essid wlp3s0}(${color red}(${wireless_link_qual_perc wlp3s0}%)${alignr}${addr wlp3s0}${color}
${offset 9}${color green}▼ $color${downspeed wlp3s0} ${alignr}${color green}▲ $color${upspeed wlp3s0}
${color black}${downspeedgraph wlp3s0 25,107 F600AA 5000a0} ${alignr}${upspeedgraph wlp3s0 25,107}${color}
${offset 9}${color green}▼ $color${totaldown wlp3s0} ${alignr}${color green}▲ $color${totalup wlp3s0}

${offset 6}${color #98c2c7}RAM :$color $mem/$memmax $memperc% ${color yellow}${membar 4}
${offset 6}${color #98c2c7}CPU:${color} $cpu% ${color yellow}$cpubar
# ${offset 6}${color #98c2c7}Swap:$color $swap/$swapmax $swapperc% ${color yellow}${swapbar 4}
${offset 6}${color #98c2c7}Hdd:${color}/ ${fs_free /}/${fs_size /} ${color yellow}${fs_bar 4 /}
${offset 6}${color #98c2c7}Battery:${color} ${battery_percent BAT1}%${color yellow}${alignr}${battery_bar 4, 130 BAT1}

${font Entopia:bold:size=12}${color 00ffae}PROCESSES ${hr 2}
${offset 12}${font Noto sans:size=8}${color EDE0FF}Highest MEM ${alignr}CPU%     MEM%
${offset 12}${color 00ffae}${top_mem name 1}$alignr${top_mem cpu 1}   ${top_mem mem 1}
${offset 12}${color 00ffae}${top_mem name 2}$alignr${top_mem cpu 2}   ${top_mem mem 2}
${offset 12}${color 00ffae}${top_mem name 3}$alignr${top_mem cpu 3}   ${top_mem mem 3}
${offset 12}${color 00ffae}${top_mem name 4}$alignr${top_mem cpu 4}   ${top_mem mem 4}
${offset 12}${color 00ffae}${top_mem name 5}$alignr${top_mem cpu 5}   ${top_mem mem 5}

${font Entopia:bold:size=12}${color red}PROCESSES ${hr 2}
${offset 12}${font Noto sans:size=8}${color EDE0FF}Name               ${alignr}PID   CPU%   MEM%
${offset 12}${color FF7878}${top name 1} ${alignr}${top pid 1} ${top cpu 1} ${top mem 1}
${offset 12}${color FF7878}${top name 2} ${alignr}${top pid 2} ${top cpu 2} ${top mem 2}
${offset 12}${color FF7878}${top name 3} ${alignr}${top pid 3} ${top cpu 3} ${top mem 3}
${offset 12}${color FF7878}${top name 4} ${alignr}${top pid 4} ${top cpu 4} ${top mem 4}
${offset 12}${color FF7878}${top name 5} ${alignr}${top pid 5} ${top cpu 5} ${top mem 5}${font}

]]

--[[
   # ${offset 25}${font DejaVu Sans Mono:size=8}${battery_time BAT1}${font DejaVu Sans Mono:size=8}${color FFFDE2}
   # ${downspeedgraph wlp3s0 324D23 77B753}
   ${offset 15}Ext IP Addr ${color red}${alignr}${exec curl ipinfo.io/ip}

   ${alignc}   ${exec hostnamectl | grep Architecture | cut -c7-30}
   ${alignc}   ${exec hostnamectl | grep Kernel | cut -c13-32}


]]
