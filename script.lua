#!/usr/bin/env lua

local function splitIp(inputIp)
  local aTable={}
  local i = 1
  for str in string.gmatch(inputIp, "([%d]+)") do
    aTable[i] = tonumber(str)
    i = i + 1
  end
  return aTable
end


--[[
Converts an IP String to its integer representation
  
@param ip1 {string} An IP Address in the form a.b.c.d
@param ip2 {string} An IP Address in the form a.b.c.d
@return {number} The integer representation of the IP address
]]

local function numberBetweenIps(ip1, ip2)
  local ips1Table = splitIp(ip1)
  local ips2Table = splitIp(ip2)
  local diffIndex = 0
  
  for i = 1, 4 do
    if (ips1Table[i] ~= ips2Table[i]) then
      diffIndex = i
      break
    end
  end

  local numDiff = 0
  local multiply = 1
  
  for j = 4, diffIndex, -1 do
    numDiff = numDiff + (ips2Table[j] - ips1Table[j]) * multiply
    multiply = multiply * 256
  end
  io.write('\nnumber between ips is ', numDiff, '\n')
  return numDiff
end

io.write('Write IPv4 to start with: ')
local input1 = io.read()
io.write('\nWrite IPv4 to end (must be bigger than first IP): ')
local input2 = io.read()
numberBetweenIps(input1, input2)

-- print(' == 126158 ', numberBetweenIps('10.0.20.50', '10.2.1.0') == 126158)
-- print(' == 50 ', numberBetweenIps('10.0.0.0', '10.0.0.50') == 50)
-- print(' == 256 ', numberBetweenIps('10.0.0.0', '10.0.1.0') == 256)
-- print(' == 246 ', numberBetweenIps('20.0.0.10', '20.0.1.0') == 246)
-- print(' == 1 ', numberBetweenIps("150.0.0.0", "150.0.0.1") == 1)
-- print(' == 50 ', numberBetweenIps("10.0.0.0", "10.0.0.50") == 50)
-- print(' == 246 ', numberBetweenIps("20.0.0.10", "20.0.1.0") == 246)
-- print(' == 243 ', numberBetweenIps("10.11.12.13", "10.11.13.0") == 243)
-- print(' == 256 ', numberBetweenIps("160.0.0.0", "160.0.1.0") == 256)
-- print(' == 65536 ', numberBetweenIps("170.0.0.0", "170.1.0.0") == 65536)
-- print(' == 65793 ', numberBetweenIps("50.0.0.0", "50.1.1.1") == 65793)
-- print(' == 16777216 ', numberBetweenIps("180.0.0.0", "181.0.0.0") == 16777216)
-- print(' == 67372036 ', numberBetweenIps("1.2.3.4", "5.6.7.8") == 67372036)
-- print(' == 4294967295 ', numberBetweenIps("0.0.0.0", "255.255.255.255") == math.pow(2, 32) - 1)