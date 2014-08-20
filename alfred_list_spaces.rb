#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'totalspaces2'

def alfred_list_spaces(query)
    query.strip!

    query_reg = /^#{query.downcase.split('').join('.*?') + '.*?'}/

    # Commented out as it slows things down a bit
    # windows = TotalSpaces2.window_list

    prefix = '
        <?xml version="1.0"?>
        <items>
        '
    postfix = '
        </items>
        '
    items = ''
    currently_at = "
        <item uid='#{Time.now.to_s}' valid='no'>
            <title>Currently at space #{TotalSpaces2.current_space}, named “#{TotalSpaces2.name_for_space(TotalSpaces2.current_space)}”</title>
        </item>
        "

    for space in 1..TotalSpaces2.number_of_spaces
        name_for_space = TotalSpaces2.name_for_space(space)
        uid = name_for_space
        if query.length == 0
            uid = Time.now.to_s + name_for_space
        end

        if space == query.to_i or query.length == 0 or query_reg.match name_for_space.downcase

            unique_apps = []

            # for window in windows.select {|window| window[:space_number] == space and not window[:is_on_all_spaces] }
            #   name = window[:app_name]
            #   if unique_apps.length == 0
            #     unique_apps.push("#{name} (#{window[:title]})")
            #   else
            #     unique_apps.push("#{name}")
            #   end
            # end

            items += "
                <item uid='#{uid}' arg='#{space}' valid='yes' autocomplete=' #{name_for_space}'>
                    <title>#{name_for_space}</title>
                    <subtitle>Go to space number #{space}</subtitle>
                </item>
                "
        end
    end

    if items == ''
        items = "
            <item valid='no'>
                <title>No space found starting with “#{query}”</title>
            </item>
        "
    elsif query.length == 0
        items = currently_at + items
    end

    puts prefix + items + postfix
end
