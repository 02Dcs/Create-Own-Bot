function msg(x)
 print(x);
end

return {
ai = function(Properties)
local Properties = typeof(Properties) == "table" and Properties or {};
local text = msg(Properties);
end,
}


