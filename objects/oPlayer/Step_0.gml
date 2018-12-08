/// @description Movement and Physics

// Check which keys are pressed
// Left Keys ( Left Arrow and A )
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
// Right Keys ( Right Arrow and D )
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
// Space Key
key_jump = keyboard_check_pressed(vk_space);

// Calculate the direction of the movement ( 1 = Right , 0 = Still , -1 = Left )
var move = key_right - key_left;

// Calculate the ingame movement with the set walking speed
hsp = move * walksp;

// Grevity calculation for the player
vsp = vsp + grv;

// Check if player is in the floor
if(place_meeting(x,y+1,oWall)) && (key_jump) {
	vsp = -3;
}

// Predict if an obstacle will be in the way of the player
if (place_meeting(x+hsp,y,oWall)) {
	while (!place_meeting(x+sign(hsp),y,oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

// Apply gravity to the player if there is no ground underneath the player
if (place_meeting(x,y+vsp,oWall)) {
	while (!place_meeting(x,y+sign(vsp),oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

// Animation ( Aniq plz make sprites )
if(!place_meeting(x,y+1,oWall)) {
	sprite_index = sPlayerJump;
	image_speed = 1;
	if (sign(vsp) > 0) {
		image_speed = 1;
		image_index = 0;
	} else {
		image_index = 0;
	}
} else {
	image_speed = 1;
	if(hsp == 0) {
		sprite_index = sPlayer;
	} else {
		sprite_index = sPlayerRun;
	}
}

if (hsp != 0) image_xscale = sign(hsp);