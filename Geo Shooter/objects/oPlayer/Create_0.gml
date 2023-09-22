event_inherited()

#region Player Movement

spd = 4
accel = 0.5
hspd = 0
vspd = 0

#endregion

#region Player Shooting


rpm = 60
shootingInterval = true
bulletAmount = 1
currentMode = 0

maxBulletCharge = 100
bulletCharge = maxBulletCharge

var novaBasic = new shootingMode("Flame Rounds", "Nova", sFiringModeNova, 0, 0, 1, 1, c_red)
var sonicBasic = new shootingMode("Sound Burst", "Sonic", sFiringModeSonic, 0, 0, 25, 5, c_aqua)
var cosmicBasic = new shootingMode("Astral Barrage", "Cosmic", sFiringModeCosmic, 0, 0, 5, 3, c_purple)
var runicBasic = new shootingMode("Magic Stream", "Runic", sFiringModeRunic, 0, 0, 30, 10, c_green)

shootingModeSlots = [novaBasic, sonicBasic, cosmicBasic, runicBasic]

updateFiring();

#endregion


text_x = x + 128;
text_y = y + 128;
displayText = "Your Stats";
delayFactor = 0.05;
sinWave = 0;