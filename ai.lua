function msg(x)
for _,v in next, (x) do
return print(v)
end
end

return {
ai = function(Properties)
local Properties = typeof(Properties) == "table" and Properties or {};
local text = msg(Properties);
end,
}


