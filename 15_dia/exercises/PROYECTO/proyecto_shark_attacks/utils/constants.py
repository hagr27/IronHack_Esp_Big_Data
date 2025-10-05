# utils/constants.py

# --------------------------------
# SEASONS
# --------------------------------
NORTH_COUNTRIES = [
    # NORTH AMERICA & CENTRAL AMERICA
    'UNITED STATES',
    'CANADA',
    'MEXICO',
    'GUATEMALA',
    'BELIZE',
    'HONDURAS',
    'EL SALVADOR',
    'NICARAGUA',
    'COSTA RICA',
    'PANAMA',
    # CARIBBEAN
    'CUBA',
    'DOMINICAN REPUBLIC',
    'HAITI',
    'JAMAICA',
    'BAHAMAS',
    'PUERTO RICO',
    'ANTIGUA AND BARBUDA',
    'SAINT KITTS AND NEVIS',
    'DOMINICA',
    'SAINT LUCIA',
    'GRENADA',
    'BARBADOS',
    # EUROPE
    'ICELAND',
    'NORWAY',
    'SWEDEN',
    'FINLAND',
    'DENMARK',
    'UNITED KINGDOM',
    'IRELAND',
    'FRANCE',
    'SPAIN',
    'PORTUGAL',
    'GERMANY',
    'BELGIUM',
    'NETHERLANDS',
    'LUXEMBOURG',
    'SWITZERLAND',
    'AUSTRIA',
    'ITALY',
    'POLAND',
    'CZECH REPUBLIC',
    'SLOVAKIA',
    'HUNGARY',
    'ROMANIA',
    'BULGARIA',
    'GREECE',
    'CROATIA',
    'BOSNIA AND HERZEGOVINA',
    'SERBIA',
    'MONTENEGRO',
    'ALBANIA',
    'NORTH MACEDONIA',
    'SLOVENIA',
    'ESTONIA',
    'LATVIA',
    'LITHUANIA',
    'BELARUS',
    'UKRAINE',
    'MOLDOVA',
    'MALTA',
    'RUSSIA (EUROPEAN PART)',
    'GEORGIA',
    'ARMENIA',
    'AZERBAIJAN',
    # ASIA
    'TURKEY',
    'CYPRUS',
    'SYRIA',
    'LEBANON',
    'ISRAEL',
    'JORDAN',
    'IRAQ',
    'IRAN',
    'KAZAKHSTAN',
    'UZBEKISTAN',
    'TURKMENISTAN',
    'KYRGYZSTAN',
    'TAJIKISTAN',
    'AFGHANISTAN',
    'PAKISTAN',
    'INDIA',
    'NEPAL',
    'BHUTAN',
    'BANGLADESH',
    'CHINA',
    'MONGOLIA',
    'NORTH KOREA',
    'SOUTH KOREA',
    'JAPAN',
    'TAIWAN',
    # AFRICA
    'MOROCCO',
    'ALGERIA',
    'TUNISIA',
    'LIBYA',
    'EGYPT',
    'MAURITANIA',
    'SUDAN',
    'ERITREA',
    'DJIBOUTI' ]

MAPPING_COUNTRIES = {
    "MALDIVE ISLANDS": "MALDIVES",
    "UNITED ARAB EMIRATES (UAE)": "UNITED ARAB EMIRATES",
    "BRITISH WEST INDIES": "WEST INDIES",
    "ST. MAARTIN": "SAINT MARTIN",
    "ST. MARTIN": "SAINT MARTIN",
    "RED SEA / INDIAN OCEAN": "RED SEA",
    "ANDAMAN / NICOBAR ISLANDAS": "ANDAMAN AND NICOBAR ISLANDS",
    "ITALY / CROATIA": "ITALY",
    "IRAN / IRAQ": "MIDDLE EAST",
    "EQUATORIAL GUINEA / CAMEROON": "EQUATORIAL GUINEA",
    "NAN": None,
    "COLUMBIA": "COLOMBIA",
    "MID-PACIFC OCEAN": "MID-PACIFIC OCEAN",
    "SAN DOMINGO": "DOMINICAN REPUBLIC",
    "USA": "UNITED STATES",
    "EGYPT / ISRAEL": "EGYPT",
    "MIDDLE EAST": "ASIA",
}

# ---------------------------------------------------------------
# ACTIVITY - Diccionario de palabras clave y correcciones comunes
# ---------------------------------------------------------------
ACTIVITY_CORRECTIONS = {
    "surfng": "surf",
    "bodysurfing": "bodyboard",
    "boogieboarding": "bodyboard",
    "kiteboarding": "kite surfing",
    "standup paddleboarding": "paddle boarding",
    "sup": "paddle boarding"
}

# Diccionario de mapeo a categorías
ACTIVITY_MAPPING = {
    # Swimming & Wading
    "float": "Swimming & Wading",
    "kneeling in the water": "Swimming & Wading",
    "swim": "Swimming & Wading",
    "wade": "Swimming & Wading",
    "wading": "Swimming & Wading",
    "sitting in the water": "Swimming & Wading",
    "treading water": "Swimming & Wading",

    # Surf & Board
    "body board": "Surf & Board",
    "bodyboard": "Surf & Board",
    "boogie": "Surf & Board",
    "kite": "Surf & Board",
    "skimboarding": "Surf & Board",
    "paddle": "Surf & Board",
    "surf": "Surf & Board",
    "board": "Surf & Board",
    "windsurf": "Surf & Board",

    # Diving
    "cage": "Diving",
    "dive": "Diving",
    "diving": "Diving",
    "free dive": "Diving",
    "freediving": "Diving",
    "hookah diving": "Diving",
    "scuba": "Diving",
    "snorkel": "Diving",
    "spearfish": "Diving",

    # Boating & Sailing
    "boat": "Boating & Sailing",
    "canoe": "Boating & Sailing",
    "jet skiing": "Boating & Sailing",
    "kayak": "Boating & Sailing",
    "row": "Boating & Sailing",
    "sail": "Boating & Sailing",
    "yacht": "Boating & Sailing",
    "wakeboarding": "Boating & Sailing",

    # Fishing
    "crabbing": "Fishing",
    "fish": "Fishing",
    "fishing": "Fishing",
    "netting": "Fishing",
    "shrimping": "Fishing",

    # Sharks & Dangerous Encounters
    "shark": "Sharks & Dangerous Encounters",

    # Playing & Leisure
    "bathing": "Playing & Leisure",
    "play": "Playing & Leisure",
    "splash": "Playing & Leisure",
    "standing": "Playing & Leisure",
    "walking": "Playing & Leisure",

    # Disasters & Accidents
    "disaster": "Disasters & Accidents",
    "ferry capsized": "Disasters & Accidents",
    "motor launch": "Disasters & Accidents",
    "shipwreck": "Disasters & Accidents",
    "sinking": "Disasters & Accidents",

    # Unknown / Other
    "unknown": "Unknown"
}

# --------------------------------
# Correcciones y mapeo de especies
# --------------------------------
SPECIES_CORRECTIONS = {
    "white shark,": "white shark",
    "tiger shark,": "tiger shark",
    "bull shark,": "bull shark",
    "blacktip or spinner shark": "blacktip shark",
    "oceanic whitetip shark": "oceanic whitetip",
    '"small shark"': "small shark",
    '"a small shark"': "small shark",
    "shark involvement not confirmed": "not confirmed",
    "shark involvement questionable": "not confirmed",
    "shark involvement prior to death not confirmed": "not confirmed",
    "shark involvement prior to death was not confirmed": "not confirmed",
    "shark involvement highly doubtful": "not confirmed",
    "shark involvement probable, but not confirmed": "not confirmed",
    "shark involvement suspected": "not confirmed",
    "shark involvement not cofirmed": "not confirmed",
    "not a shark attack; it was a hoax": "not confirmed",
    "death may have been due to drowning": "not confirmed",
    "injury believed caused by an eel, not a shark": "not confirmed",
    "invalid": "not confirmed",
    "questionable": "not confirmed",
    "suspected": "not confirmed",
    "spurdog": "other",
    "no shark invovlement": "not confirmed",
    "no shark involvement": "not confirmed"
}

SPECIES_MAPPING = {
    "white shark": "White Shark",
    "tiger shark": "Tiger Shark",
    "bull shark": "Bull Shark",
    "blacktip": "Blacktip Shark",
    "nurse shark": "Nurse Shark",
    "hammerhead": "Hammerhead Shark",
    "oceanic whitetip": "Oceanic Whitetip Shark",
    "lemon shark": "Lemon Shark",
    "galapagos shark": "Galapagos Shark",
    "bronze whaler": "Bronze Whaler Shark",
    "other": "Other Shark",
    "small shark": "Small Shark",
    "not confirmed": "Unconfirmed",
    "unknown": "Unconfirmed"
}

RISK_MAPPING = {
    "White Shark": "High Risk",
    "Tiger Shark": "High Risk",
    "Bull Shark": "High Risk",
    "Oceanic Whitetip Shark": "High Risk",
    "Hammerhead Shark": "Moderate Risk",
    "Blacktip Shark": "Moderate Risk",
    "Bronze Whaler Shark": "Moderate Risk",
    "Nurse Shark": "Low Risk",
    "Lemon Shark": "Low Risk",
    "Galapagos Shark": "Low Risk",
    "Other Shark": "Low Risk",
    "Small Shark": "Low Risk",
    "Unconfirmed": "Unknown"
}