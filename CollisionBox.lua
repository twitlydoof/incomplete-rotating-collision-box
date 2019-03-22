local Vector2 = require("Vector2");
local CollisionBox = {};


function CollisionBox:update()

	--[[
	local width = self.size.x;
	local height = self.size.y;
	

	local left = self.position.x+width/2 - width/2*math.cos(self.rotation);
	local right = self.position.x+width/2 + width/2*math.cos(self.rotation);
	local top = self.position.y+height/2 - height/2*math.sin(self.rotation+math.pi/2);
	local bottom = self.position.y+height/2 + height/2*math.sin(self.rotation+math.pi/2);


	self.corners[1] = left;
	self.corners[2] = top;
	self.corners[3] = right;
	self.corners[4] = top;
	self.corners[5] = right;
	self.corners[6] = bottom;
	self.corners[7] = left;
	self.corners[8] = bottom;
	print("left", left);
	print("right", right);
	print("top", top);
	print("bottom", bottom);]]--

	local x, y = self.position.x, self.position.y
	local left = x * math.cos(self.rotation) - y * math.sin(self.rotation);
	local top = x * math.sin(self.rotation) + y * math.cos(self.rotation);
	local right = (x+self.size.x) * math.cos(self.rotation) - y * math.sin(self.rotation);
	local bottom = x * math.sin(self.rotation) + (y+self.size.y) * math.cos(self.rotation);


	self.corners[1] = left	;
	self.corners[2] = top;
	self.corners[3] = right;
	self.corners[4] = top;
	self.corners[5] = right;
	self.corners[6] = bottom;
	self.corners[7] = left;
	self.corners[8] = bottom;
	self.corners[9] = left;
	self.corners[10] = top;

end;

local line = love.graphics.line;
function CollisionBox:draw()
	line(self.corners);
	line(self.position.x, self.position.y, self.corners[1], self.corners[2]);
end;

return function(position, size)
	position = position or Vector2();
	size = size or Vector2(10, 10);
	local collisionBox = {
		corners = {};
		
		draw = CollisionBox.draw;

		position = position;

		rotation = 0;

		size = size;

		update = CollisionBox.update;
	};


	collisionBox.corners = {
		position.x				, position.y,
		position.x+size.x		, position.y,
		position.x+size.x		, position.y+size.y,
		position.x				, position.y+size.y,
		position.x				, position.y,
	};
	
	return collisionBox;
end;