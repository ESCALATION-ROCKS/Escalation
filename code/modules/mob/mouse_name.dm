#define ICONWIDTH 64
//	This is the width of your icons.  So, if your /mob icons are 64x64, set this to 64.
#define FONT_ICON_WIDTH 8
//	This is the visual width of the font_icon.dmi icon_states (not the width of the actual icon_states, just the visual width - empty space).

var/list/preset_characters = list(
"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "X",
"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "`", "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "+", "=",
"\[", "]", "\\", "|", ":", ";", "'", "\"", "<", ",", ">", ".", "/", "?", " ",
)
//	These are all of the available characters in font_icon.dmi

atom/var/list/name_color = list("red" = 0, "green" = 0, "blue" = 0)
//	This will handle the RGB value.
atom/var/mouse_name
//	This is the physical name.
atom/var/image/mouse_name_image
//	This is the converted /image of the name.
client/var/name_fade_time = 30
//	This is how long in ticks the image will stay visible.

world
	New()
		presetCharacters()
		//	We are going to pre-make the letter/number images.
		..()

proc
	makeMouseNameObj(atom/target)
		var/mouse_name/display_obj = new()
		target.mouse_name = display_obj

	presetCharacters()
		for(var/character in preset_characters)
			var/icon/new_character_icon = icon('icons/font_icon.dmi', "[character]")
			preset_characters[character] = new_character_icon

	nameToList(atom/target)
		var/list/name_list = list()
		for(var/letter = 1, letter < lentext(target.name) + 1, letter++)
			name_list += copytext(target.name, letter, letter + 1)
		return name_list

	showName(atom/target, client/player)
		world >> "456"
		player.images += target.mouse_name_image
		spawn(player.name_fade_time)
			player.images -= target.mouse_name_image

	makeName(atom/target)
		var/mouse_name/name_obj = target.mouse_name
		var/image/name_image = image(name_obj.icon, target)
		name_image.pixel_x = (ICONWIDTH - (lentext(target.name) * FONT_ICON_WIDTH)) / 2
		name_image.pixel_y -= 8
		target.mouse_name_image = name_image

	generateName(atom/target)
		var/list/target_name = nameToList(target)
		var/mouse_name/name_obj = target.mouse_name
		var/icon/name_icon  = new('icons/font_icon.dmi')
		name_icon.Crop(1, 1, lentext(target.name) * 8, 16)
		for(var/character in target_name)
			var/icon/character_icon = preset_characters[character]
			name_icon.Shift(WEST, 8, 1)
			name_icon.Blend(character_icon, ICON_OVERLAY)
		name_icon.Shift(WEST, 12, 1)
		name_icon += rgb(target.name_color["red"], target.name_color["green"], target.name_color["blue"])
		name_obj.icon = name_icon
		makeName(target)

	changeName(atom/target, new_name as text)
		target.name = new_name
		generateName(target)

mouse_name
	parent_type = /obj
	icon = 'icons/font_icon.dmi'
	pixel_y = -16
	layer = 88


mob/MouseEntered()
	world >> "123"
	showName(src, usr.client)
	..()