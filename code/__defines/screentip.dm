#define SCREENTIP_OPENSPACE(name) "<span style='text-align: center;font-family: \"Arial Black\";font-size:9px;-dm-text-outline: 2px black;color: #47474780'>[name]</span>"
#define SCREENTIP_TURF(name) "<span style='text-align: center;font-family: \"Arial Black\";font-size:9px;-dm-text-outline: 2px black;color: #75757580'>[name]</span>"
#define SCREENTIP_OBJ(name) "<span style='text-align: center;font-family: \"Arial Black\";font-size:9px;-dm-text-outline: 2px black;color: #a8a8a880'>[name]</span>"
#define SCREENTIP_MOB(name) "<span style='text-align: center;font-family: \"Arial Black\";font-size:9px;-dm-text-outline: 2px black;color: #FFFFFF80'>[name]</span>"

// ~screentip flags
#define SCREENTIP_ON_MOUSE_ENTERED (1<<0)
#define SCREENTIP_ON_MOUSE_MOVE (1<<1)
#define SCREENTIP_ON_MOUSE_CLICK (1<<2)

#define DEFAULT_SCREENTIP_FLAGS (SCREENTIP_ON_MOUSE_ENTERED)
#define SCREENTIP_HOVERER (SCREENTIP_ON_MOUSE_ENTERED|SCREENTIP_ON_MOUSE_MOVE)
#define SCREENTIP_HOVERER_CLICKER (SCREENTIP_ON_MOUSE_ENTERED|SCREENTIP_ON_MOUSE_MOVE|SCREENTIP_ON_MOUSE_CLICK)
