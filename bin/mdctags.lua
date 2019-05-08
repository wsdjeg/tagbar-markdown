if (arg[2] == nil)
    then
    print("!_TAG_FILE_FORMAT 2 /extended format; --format=1 will not append ;\" to lines/' ")
    print("!_TAG_FILE_SORTED 0 /0=unsorted, 1=sorted, 2=foldcase/' ")
    print("!_TAG_PROGRAM_AUTHOR lvht /git@lvht.net/'")
    print("!_TAG_PROGRAM_NAME mdctags //' ")
    print("!_TAG_PROGRAM_URL https://github.com/lvht/tagbar-markdown /official site/'")
    print("!_TAG_PROGRAM_VERSION 0.1.0 //'")
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
                print(line)
                local title = string.find(line, '%S+$')
                local anchor = #string.match(line, '^#+')
                local line = { title = title, level = #string.match(line, '^#+')}
                print(line.level)
            end
        end
    end
end
