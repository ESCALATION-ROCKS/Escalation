//yeah
#define FULLBLOCK_RETURN_VALUE 101
#define FULLBLOCK_DAMAGE_ABSORPTION 90

//armor damage sounds defines
#define ARMOR_DAMAGED_SOUNDS_STANDARD list('sound/bullet/projectile_impact/bullet_impact_vest1.wav', \
							'sound/bullet/projectile_impact/bullet_impact_vest2.wav', \
							'sound/bullet/projectile_impact/bullet_impact_vest3.wav', \
							'sound/bullet/projectile_impact/bullet_impact_vest4.wav')
#define ARMOR_BROKE_SOUNDS_STANDARD list('sound/bullet/projectile_impact/bullet_impact_vest5.wav')

#define ARMOR_DAMAGED_SOUNDS_STONE list('sound/bullet/projectile_impact/bullet_impact_stone1.wav', \
							'sound/bullet/projectile_impact/bullet_impact_stone2.wav', \
							'sound/bullet/projectile_impact/bullet_impact_stone3.wav')
#define ARMOR_BROKE_SOUNDS_STONE list('sound/bullet/projectile_impact/bullet_impact_stone4.wav')

#define ARMOR_DAMAGED_SOUNDS_METAL list('sound/bullet/projectile_impact/bullet_impact_metal1.wav', \
							'sound/bullet/projectile_impact/bullet_impact_metal2.wav', \
							'sound/bullet/projectile_impact/bullet_impact_metal3.wav')
#define ARMOR_BROKE_SOUNDS_METAL list('sound/bullet/projectile_impact/bullet_impact_metal4.wav')

//default normal block values for helmets and vests
#define DEFAULT_ARMOR_NORMALBLOCK list(melee = 35, bullet = 50, laser = 25, energy = 25, bomb = 35, bio = 0, rad = 0)

//default fullblock values for helmets and vests
#define DEFAULT_ARMOR_FULLBLOCK list(melee = 60, bullet = 100, laser = 0, energy = 0, bomb = 85, bio = 0, rad = 0)
