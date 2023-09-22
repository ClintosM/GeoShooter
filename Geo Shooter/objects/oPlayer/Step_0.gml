/// @description desc
scr_movement()
scr_PlayerShooting()

// Step Event of obj_player
text_x += (x - text_x + 24) * delayFactor;
text_y += (y - text_y + 24) * delayFactor;

sinWave += 0.1; // Increase this value to make the hover effect faster

if keyboard_check_released(vk_backspace) {
	room_restart()
}

//direction = point_direction(x, y, oCursor.x, oCursor.y)