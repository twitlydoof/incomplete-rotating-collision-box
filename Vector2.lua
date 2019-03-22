local Vector2 = {};
local newVector2 = function(x, y)
	local vector2 = {
		x = x or 0;
		y = y or 0;
		type = "Vector2";
	}

	setmetatable(vector2, Vector2);

	return vector2;
end;




function Vector2:__mul(vector2)
	if type(vector2) == "number" then
		return newVector2(self.x * vector2, self.y * vector2);
	elseif vector2 and vector.type == "Vector2" then
		return newVector2(self.x * vector2.x, self.y * vector2.y);
	end;
end;





return newVector2;