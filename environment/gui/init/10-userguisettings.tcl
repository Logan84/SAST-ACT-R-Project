# this file generated when environment is closed
# refresh . to make sure sizes are right

wm deiconify .
update
wm withdraw .
if {[winfo screenwidth .] != 1920 || [winfo screenheight .] != 1080 || [lindex [wm maxsize .] 0] != 1905 || [lindex [wm maxsize .] 1] != 1050} {
  set size_mismatch 1
} else {
  set size_mismatch 0
}

if $size_mismatch {
  set reset_window_sizes [tk_messageBox -icon warning -title "Screen resolution changed" -type yesno \
                                         -message "The screen resolution is not the same as it was the last time the Environment was used.  Should the window positions reset to the defaults?"]
} else { set reset_window_sizes 0}
if {$reset_window_sizes != "yes"} {
  set window_config(.pgraph) 1848x1016+71+26
  set changed_window_list(.pgraph) 1
  set window_config(.ptrace) 1848x1016+71+26
  set changed_window_list(.ptrace) 1
  set window_config(.stepper) 500x550+983+185
  set changed_window_list(.stepper) 1
  set window_config(.visicon) 760x150+610+440
  set changed_window_list(.visicon) 1
  set window_config(.control_panel) 235x700+1654+181
  set changed_window_list(.control_panel) 1
  set window_config(.declarative) 420x300+782+375
  set changed_window_list(.declarative) 1
  set window_config(.whynot) 465x300+743+618
  set changed_window_list(.whynot) 1
  set window_config(.buffers) 470x240+1290+723
  set changed_window_list(.buffers) 1
  set window_config(.copyright) 400x290+760+395
  set changed_window_list(.copyright) 1
  set window_config(.procedural) 500x400+949+635
  set changed_window_list(.procedural) 1
  set window_config(.reload_response) 500x230+710+425
  set changed_window_list(.reload_response) 1
}
set gui_options(p_selected) #44DA22
set gui_options(p_matched) #FCA31D
set gui_options(p_mismatched) #E1031E
