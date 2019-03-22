local Vector2 = require("Vector2");
local CollisionBox = require("CollisionBox");

local box = CollisionBox(
	Vector2(love.graphics.getWidth()/2, love.graphics.getHeight()/2),
	Vector2(100, 100)
);


function love.update(deltaTime)
	box.rotation = box.rotation + deltaTime*0.5;
	box:update(deltaTime);
end;

function love.draw()
	box:draw();
end;