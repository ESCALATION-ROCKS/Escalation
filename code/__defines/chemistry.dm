#define DEFAULT_HUNGER_FACTOR 0.15 // Factor of how fast mob nutrition decreases

#define DEFAULT_THIRST_FACTOR 0.20 // Factor of how fast mob nutrition decreases

#define REM 0.2 // Means 'Reagent Effect Multiplier'. This is how many units of reagent are consumed per tick

#define CHEM_TOUCH 1
#define CHEM_INGEST 2
#define CHEM_BLOOD 3

#define STARVATION_MIN 200 //If you have less nutrition than this value, the hunger indicator starts flashing

#define STARVATION_NOTICE 100 //If you have more nutrition than this value, you get an occasional message reminding you that you're going to starve soon

#define STARVATION_WEAKNESS 50 //Otherwise, if you have more nutrition than this value, you occasionally become weak and receive minor damage

#define STARVATION_NEARDEATH 2 //Otherwise, if you have more nutrition than this value, you have seizures and occasionally receive damage

#define STARVATION_OXY_DAMAGE 5
#define STARVATION_TOX_DAMAGE 2.5
#define STARVATION_BRAIN_DAMAGE 2.5
#define STARVATION_OXY_HEAL_RATE 1 //While starving, THIS much oxygen damage is restored per life tick (instead of the default 5)


#define MINIMUM_CHEMICAL_VOLUME 0.01

#define SOLID 1
#define LIQUID 2
#define GAS 3
#define GEL 4

#define REAGENTS_OVERDOSE 30

#define CHEM_SYNTH_ENERGY 500 // How much energy does it take to synthesize 1 unit of chemical, in Joules.

// Some on_mob_life() procs check for alien races.
#define IS_DIONA   1
#define IS_VOX     2
#define IS_SKRELL  3
#define IS_UNATHI  4
#define IS_TAJARA  5
#define IS_XENOS   6
#define IS_SLIME   8
#define IS_NABBER  9

#define CE_STABLE        "stable"       // Inaprovaline
#define CE_ANTIBIOTIC    "antibiotic"   // Spaceacilin
#define CE_BLOODRESTORE  "bloodrestore" // Iron/nutriment
#define CE_PAINKILLER    "painkiller"
#define CE_ANTIVOMIT    "antivomit"
#define CE_ALCOHOL       "alcohol"      // Liver filtering
#define CE_ALCOHOL_TOXIC "alcotoxic"    // Liver damage
#define CE_SPEEDBOOST    "gofast"       // Hyperzine
#define CE_SLOWDOWN      "goslow"       // Slowdown
#define CE_PULSE         "xcardic"      // increases or decreases heart rate
#define CE_NOPULSE       "heartstop"    // stops heartbeat
#define CE_ANTITOX       "antitox"      // Dylovene
#define CE_OXYGENATED    "oxygen"       // Dexalin.
#define CE_BRAIN_REGEN   "brainfix"     // Alkysine.
#define CE_ANTIVIRAL     "antiviral"    // Anti-virus effect.
#define CE_TOXIN         "toxins"       // Generic toxins, stops autoheal.
#define CE_BREATHLOSS    "breathloss"   // Breathing depression, makes you need more air
#define CE_MIND    		 "mindbending"  // Stabilizes or wrecks mind. Used for hallucinations
#define CE_HEMOSTATIC    "hemostatic"       // Aminocaproic acid.

//reagent flags
#define IGNORE_MOB_SIZE 0x1
#define AFFECTS_DEAD    0x2