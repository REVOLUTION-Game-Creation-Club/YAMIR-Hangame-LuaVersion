require "go.util.GameObject"
require "CharAnimation"

class 'RGItem' (GameObject)

function RGItem:__init()super()
	self.anim = {}
	self.show = false

	self:DataReset()
end

function RGItem:DataReset()
	self.animName = "flog"
	self.pos = Vector2(0,0)
end

function RGItem:Show(show)
	if self.anim[self.animName] then
		self.anim[self.animName]:Reset()
	end
	self.show = show ~= false
end

function RGItem:CreateAnimation(animName)
	local anim = CharAnimation(animName, self)
	self.anim[animName] = anim
	return anim
end

function RGItem:SetXYPos(x, y)
	self.pos = Vector2(x, y)
end

function RGItem:ChangeItem(animName, force)
	--현재와 같은 상태로의 변화이면 무시
	if self.animName == animName then 
		return
	end
	
	if not force then
		if not self.anim[self.animName].loop then
			return
		end
	end
	
	if self.anim[self.animName] then
		self.anim[self.animName]:Reset()
	end
	 
	self.animName = animName
	self.anim[self.animName]:Reset()
end

function RGItem:OnAnimationEnd(elapsed)
end
