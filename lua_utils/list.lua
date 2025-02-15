local List = {}
local list_mt = {
    __index = function(t, k)
        return rawget(List, k) or rawget(t:get(), k)
    end,
    __tostring = function(x)
        return "['" .. table.concat(x:get(), "', '") .. "']"
    end,
}

function List:new(table)
    local data = table
    for _, x in ipairs(data) do
        data[x] = true
    end
    return setmetatable({ _data = table }, list_mt)
end

function List:from_iter(iter)
    local data = {}
    for x in iter do
        table.insert(data, x)
        data[x] = true
    end
    return setmetatable({ _data = data }, list_mt)
end

function List:get()
    return rawget(self, "_data")
end

function List:size()
    return #self:get()
end

function List:is_empty()
    return self:size() == 0
end

function List:contains(item)
    return self:get()[item] ~= nil
end

function List:contains_any(other)
    for _, x in ipairs(self:get()) do
        if other:contains(x) then
            return true
        end
    end
    return false
end

function List:group_by(grouping_func)
    local grouped_mt = {
        __index = function(t, k)
            return rawget(t, k) or rawset(t, k, {})[k]
        end,
    }
    local grouped = setmetatable({}, grouped_mt)
    for _, x in ipairs(self:get()) do
        table.insert(grouped[grouping_func(x)], x)
    end
    return self:new(grouped)
end

function List:add(item)
    assert(self:get()[item] == nil, "Item already present!")
    table.insert(self:get(), item)
    self:get()[item] = true
end

function List:remove(item)
    local index = nil
    for idx, v in ipairs(self:get()) do
        if v == item then
            index = idx
            break
        end
    end
    if index then
        table.remove(self:get(), index)
        self:get()[item] = nil
    end
end

return List
