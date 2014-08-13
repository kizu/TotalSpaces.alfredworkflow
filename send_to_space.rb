require 'totalspaces2'

def send_to_space(query)

    windows = TotalSpaces2.window_list
    current_space = TotalSpaces2.current_space
    main_display_id = TotalSpaces2.main_display[:display_id]
    if !windows.empty?
      current_space_windows = windows.select {|window| window[:display_id] == main_display_id && window[:space_number] == current_space}
      front_window = current_space_windows[0]
      TotalSpaces2.move_window_to_space(front_window[:window_id], query.to_i)
    end

end
