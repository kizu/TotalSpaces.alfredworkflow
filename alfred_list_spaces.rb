require 'totalspaces2'

def alfred_list_spaces(query)
    query.strip!

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
            <title>Currently at #{TotalSpaces2.name_for_space(TotalSpaces2.current_space)}</title>
        </item>
        "

    for space in 1..TotalSpaces2.number_of_spaces
        name_for_space = TotalSpaces2.name_for_space(space)
        uid = name_for_space
        if query.length == 0
            uid = Time.now.to_s + name_for_space
        end

        if query.length == 0 and space == TotalSpaces2.current_space
            next
        elsif query.to_i > 0 and space == query.to_i
            items += "
                <item uid='#{uid}' arg='#{name_for_space}' valid='yes' autocomplete=' #{name_for_space}'>
                    <title>#{name_for_space}</title>
                    <subtitle>Space number #{space}</subtitle>
                </item>
                "
        elsif query.length == 0 or name_for_space.downcase.start_with?(query.downcase)
            items += "
                <item uid='#{uid}' arg='#{name_for_space}' valid='yes' autocomplete=' #{name_for_space}'>
                    <title>#{name_for_space}</title>
                    <subtitle>Space number #{space}</subtitle>
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
