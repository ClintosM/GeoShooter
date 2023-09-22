counter = 0;
var alpha;
yPos = 40;
draw_set_font(fntWeaponStats)

// Calculate the oscillating alpha value for the 'breathing' effect
alpha = 0.5 * sin(current_time / 250) + 0.6;  // oscillate between 0.5 and 0.6

// First draw sprites that are NOT the currentMode
for (xPos = 40; xPos < 286; xPos += 70) {
	if (counter != currentMode) {
			
		firingModeSprite = shootingModeSlots[counter] == undefined ? sEmptyFiringMode : shootingModeSlots[counter].sprite
		draw_sprite_ext(firingModeSprite, 0, xPos, yPos , 3, 3, 0, c_gray, alpha)
		
	}
	counter += 1;
}

// Now, draw the sprite for the currentMode
xPosActive = 40 + currentMode * 70;  // Compute the xPos for the currentMode sprite

// Use the calculated alpha and scale values for the 'breathing' and 'pulsating' effects
firingModeSprite = shootingModeSlots[currentMode] == undefined ? sEmptyFiringMode : shootingModeSlots[currentMode].sprite
draw_sprite_ext(firingModeSprite, 0, xPosActive, yPos, 4, 4, 0, c_white, 1)

#region Draw Mode Name

draw_set_color(c_black)
draw_text_transformed(16, 86, shootingModeSlots[currentMode].name, 2, 2, 0)
draw_set_color(c_white)
draw_text_transformed(16, 84, shootingModeSlots[currentMode].name, 2, 2, 0)

var color = 0;

switch shootingModeSlots[currentMode].element {
	
	case "Nova":
		color = c_red
		break
		
	case "Sonic":
		color = c_aqua
		break
		
	case "Cosmic":
		color = c_purple
		break
		
	case "Runic":
		color = c_green
		break
		
	default:
		color = c_white
		break
		
	draw_set_color(color)

}
		
draw_set_color(c_black)
draw_text_transformed(16, 122, shootingModeSlots[currentMode].element, 1.5, 1.5, 0)
draw_set_color(color)
draw_text_transformed(16, 120, shootingModeSlots[currentMode].element, 1.5, 1.5, 0)

#endregion