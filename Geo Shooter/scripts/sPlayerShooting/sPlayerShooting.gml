function scr_PlayerShooting() {
    updateShootingMode()
	shootProjectile()
}

function updateShootingMode() {
    changeMade = false
    var dir = 0
    var loopCounter = 0
    var initialMode = currentMode // store the initial value of currentMode

    if mouse_wheel_up() {
        dir = 1
    } else if mouse_wheel_down() {
        dir = -1
    }
    
    if (dir != 0) {
        while (!changeMade && loopCounter < array_length(shootingModeSlots)) {
            // Increment loop counter to avoid infinite loop
            loopCounter++

            currentMode += dir

            if (currentMode > array_length(shootingModeSlots) - 1) {
                currentMode = 0
            } else if (currentMode < 0) {
                currentMode = array_length(shootingModeSlots) - 1
            }

            if (shootingModeSlots[currentMode] != undefined) {
                changeMade = true
            }
        }
    }

    // Compare initialMode to currentMode to see if a change was actually made
    if (changeMade && initialMode != currentMode) {
        updateFiring()
        audio_play_sound(sndWeaponTypeSwap, 1, 0)
    }
}



function updateFiring() {
    if (shootingModeSlots[currentMode] != undefined) {
        rpm = shootingModeSlots[currentMode].firerate
        firerateCooldown = rpm
        bulletAmount = shootingModeSlots[currentMode].bulletAmount	
    } else {
		rpm = 60;
		firerateCooldown = rpm
		bulletAmount = 1
	}
}


function shootProjectile() {
	if mouse_check_button(mb_left) {

		if shootingInterval {
			
			firerateCooldown = rpm
			
			if bulletAmount > 1 {
				for (i = 0; i < bulletAmount; i++) {
					instance_create_depth(x, y, 2, oBullet)
				}
			} else {
				instance_create_depth(x, y, 2, oBullet)
			}
			
			shootingInterval = false
		}		
	}
	
			
	if (firerateCooldown > 0 && shootingInterval == false) {
		firerateCooldown -= 1
	}
		
	if (firerateCooldown == 0) {
		shootingInterval = true;	
	}
}
