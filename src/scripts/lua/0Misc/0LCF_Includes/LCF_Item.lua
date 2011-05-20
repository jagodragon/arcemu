--[[
 * ArcEmu MMORPG Server
 * Copyright (C) 2005-2007 Ascent Team <http://www.ascentemu.com/>
 * Copyright (C) 2008-2010 <http://www.ArcEmu.org/>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *]]

 assert( include("LCF.lua") )
local ITEM = LCF.ItemMethods
assert(ITEM)
local function alias(LHAname, LBname)
   ITEM[LHAname] = function(self, ...)
      return self[LBname](self, ...);
   end
end

function ITEM:GetBuyPrice() return self:GetProto().BuyPrice; end

alias("GetEntryId", "GetEntry")

function ITEM:GetEquippedSlot()
   local o = self:GetOwner()
   if (not o or not o:GetItemInterface()) then return 0; end
   return (o:GetItemInterface():GetInventorySlotByID(self:GetEntry()))
end

function ITEM:GetItemLevel() return self:GetProto().ItemLevel; end

alias("GetMaxDurability", "GetDurabilityMax")

function ITEM:GetName() return self:GetProto().Name1; end

function ITEM:GetRequiredLevel() return self:GetProto().RequiredLevel; end

function ITEM:GetSellPrice() return self:GetProto().SellPrice; end

alias("Remove", "RemoveFromWorld")

alias("RepairItem", "SetDurabilityToMax")

function ITEM:GetObjectType() return "Item"; end