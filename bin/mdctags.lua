if (arg[2] == nil)
    then
    print("!_TAG_FILE_FORMAT 2 /extended format; --format=1 will not append ;\" to lines/' ")
    print("!_TAG_FILE_SORTED 0 /0=unsorted, 1=sorted, 2=foldcase/' ")
    print("!_TAG_PROGRAM_AUTHOR lvht /git@lvht.net/'")
    print("!_TAG_PROGRAM_NAME mdctags //' ")
    print("!_TAG_PROGRAM_URL https://github.com/lvht/tagbar-markdown /official site/'")
    print("!_TAG_PROGRAM_VERSION 0.1.0 //'")
end

local function reverseTable(tab)
	local tmp = {}
	for i = 1, #tab do
		local key = #tab
		tmp[i] = table.remove(tab)
	end

	return tmp
end

if (arg[1] ~= nil)
    then
    local file = io.open(arg[1], "r")
    local file_path = ''
    local stack = {}
    local in_code = false
    local lineNo = 0
    if file then
        for line in file:lines() do
            lineNo = lineNo + 1
            if string.find(line, '^```') ~= nil
                then
                in_code = not in_code
            end
            if not in_code and string.find(line, '^#+%s+') ~= nil
                then
                local title = string.match(line, '%S+$')
                local anchor = #string.match(line, '^#+')
                local line = { title = title, level = #string.match(line, '^#+')}
                if #stack == 0 then
                    table.insert(stack, 0, line)
                elseif stack[0].level < line.level then
                    table.insert(stack, 0, line)
                else
                    while #stack ~= 0 and stack[0].level >= line.level do
                        table.insert(stack, line)
                    end
                    table.insert(stack, 0, line)
                end
                local scopes = {}
                for item in reverseTable(stack) do
                    table.insert(scopes, item.title)
                end
                table.remove(scopes)
                local scopesStr = table.concat(scopes, '::')

            -- $level = $line['level'];
            -- if (count($stack) < 2) {
                -- $plevel = $level > 1 ? $level - 1 : 0;
            -- } else {
                -- $parent = $stack[1];
                -- $plevel = $parent['level'];
            -- }
            -- $scope = $scopesStr ? "h$plevel:$scopesStr" : '';
            -- $type = chr(0x60 + $level);
--
            -- if (isset($argv[2])) {
                -- if ($level > 1) {
                    -- $title = $matches[2];
                    -- echo str_pad('', strlen($matches[1])-2, ' ')."- [$title](#$title)\n";
                -- }
            -- } else {
                -- echo "$title\t$path\t/^$anchor\$/;\"\t$type\tline:$lineNo\t$scope\n";
            -- }
            end
        end
    end
end
