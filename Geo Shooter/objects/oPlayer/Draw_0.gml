/// @description desc
// Draw Event of obj_player
draw_self()  // Draw the player itself

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

if oMenuHandler.isEnabled == true {

	draw_set_font(fntPlayerStats)
	draw_set_color(c_black)
	draw_text(text_x, text_y + 1 + sin(sinWave) * 5, displayText)
	draw_set_color(color)
	draw_text(text_x, text_y + sin(sinWave) * 5, displayText)
	
}