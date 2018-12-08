if(pjump == true) {
	if !(y == ojy) {
		y = y - jsp;
		if !(jsp == 1) {
			jsp = jsp - jsp_decay;
		}
	} else {
		pjump = false;
		pgrv = true;
		grv = ogrv;
	}
}

if(pgrv == true) {
	if !place_meeting(x,y + 1,oWall) {
		y = y + grv;
		if(grv < 3.0) {
			grv = grv + grv_inc;
		}
	} else {
		pgrv = false;
		autograv = true;
	}
}

if(autograv == true) {
	if !place_meeting(x,y + 1,oWall) {
		y = y + grv;
		if(grv < 3.0) {
			grv = grv + grv_inc;
		}
	}
}