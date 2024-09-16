#region //Get player input

if (hascontrol)
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

#endregion

#region //Calculate Horizontal Movement
walljumpdelay = max(walljumpdelay-1,0);
if (walljumpdelay == 0)
{
	var _dir = key_right - key_left;
	hsp += _dir * hsp_acc;
	if (_dir == 0)
	{
		var _hsp_fric_final = hsp_fric_ground;
		if (!onground) _hsp_fric_final = hsp_fric_air;
		hsp = scr_approach(hsp,0,_hsp_fric_final);
	}
	hsp = clamp(hsp,-hsp_walk,hsp_walk);
}
//Wall Jump
if (onwall != 0) && (!onground) && (key_jump)
{
	walljumpdelay = walljumpdelay_max;
	
	hsp = -onwall * hsp_wjump;
	vsp = vsp_wjump;
	
	hsp_frac = 0;
	vsp_frac = 0;
}

#endregion

#region //Calculate Vertical Movement
var _grv_final = grv;
var _vsp_max_final = vsp_max;
if (onwall != 0) && (vsp > 0)
{
	_grv_final = grv_wall;
	_vsp_max_final = vsp_max_wall
}
vsp += _grv_final;
vsp = clamp(vsp,-_vsp_max_final,_vsp_max_final);

//Ground Jumping
if (jumpbuffer > 0)
{
	jumpbuffer--;
	if(key_jump)
	{
		jumpbuffer = 0;
		vsp = vsp_jump;
		vsp_frac = 0;
	}
}
vsp = clamp(vsp,-vsp_max,vsp_max);

#endregion

#region //Dump fractions and get final integer speeds
hsp += hsp_frac;
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac

#endregion

#region //Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
	var _onepixel = sign(hsp);
	while (!place_meeting(x+_onepixel,y,obj_wall)) x += _onepixel;
	hsp = 0;
	hsp_frac = 0;
}
//Horizontal Move
x += hsp;

#endregion

#region //Vertical Collision
if (place_meeting(x,y+vsp,obj_wall))
{
	var _onepixel = sign(vsp);
	while (!place_meeting(x,y+_onepixel,obj_wall)) y += _onepixel;
	vsp = 0;
	vsp_frac = 0;
}
//Veritcal Move
y += vsp;

#endregion

#region //Calculate Current Status
onground = place_meeting(x,y+1,obj_wall);
onwall = place_meeting(x+1,y,obj_wall) - place_meeting(x-1,y,obj_wall);
if (onground) jumpbuffer = 6;

#endregion

#region //Animations
if (!place_meeting(x,y+1,obj_wall))
{
	if (onwall != 0)
	{
		sprite_index = spr_player_jumping;
		image_xscale = onwall;
		
		var _side = bbox_left;
		if (onwall == 1) _side = bbox_right;
		dust++;
		if ((dust > 2) && (vsp > 0)) with (instance_create_layer(_side,bbox_top,"Player",obj_dust))
		{
			other.dust = 0;
			hspeed = -other.onwall*0.5;
		}
	}
	else
	{
		dust = 0;
		sprite_index = spr_player_jumping;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
}
else
{
	jumpbuffer = 10;
	if (sprite_index == spr_player_jumping)
	{
		audio_sound_pitch(snd_landing,choose(0.8,1.0,1.2));
		audio_play_sound(snd_landing,4,false);
		repeat(5)
		{
			with (instance_create_layer(x,bbox_bottom,"Player",obj_dust))
			{
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_player;
	}
	else
	{
		sprite_index = spr_player_running;
	}
}

if (hsp != 0) image_xscale = sign(hsp);

#endregion