class Url < ActiveRecord::Base
  attr_accessible :url, :codename
  validates_uniqueness_of :url, :codename
  validates :url, :presence => true, :url => true

  #Below is a list of curse words taken from GOOGLE'S banned words list!
  BADWORDS = ["4r5e",
			  "5h1t",
			  "5hit",
			  "a55",
			  "anal",
			  "anus",
			  "ar5e",
			  "arrse",
			  "arse",
			  "ass",
			  "ass-fucker",
			  "asses",
			  "assfucker",
			  "assfukka",
			  "asshole",
			  "assholes",
			  "asswhole",
			  "a_s_s",
			  "btch",
			  "b00bs",
			  "b17ch",
			  "b1tch",
			  "ballbag",
			  "balls",
			  "ballsack",
			  "bastard",
			  "beastial",
			  "beastiality",
			  "bellend",
			  "bestial",
			  "bestiality",
			  "bich",
			  "biatch",
			  "bitch",
			  "bitcher",
			  "bitchers",
			  "bitches",
			  "bitchin",
			  "bitching",
			  "bloody",
			  "blowjob",
			  "blowjob",
			  "blowjobs",
			  "boiolas",
			  "bollock",
			  "bollok",
			  "boner",
			  "boob",
			  "boobs",
			  "booobs",
			  "boooobs",
			  "booooobs",
			  "booooooobs",
			  "breasts",
			  "buceta",
			  "bugger",
			  "bum",
			  "bunnyfucker",
			  "butt",
			  "butthole",
			  "buttmuch",
			  "buttplug",
			  "c0ck",
			  "c0cksucker",
			  "carpetmuncher",
			  "cawk",
			  "chink",
			  "cipa",
			  "cl1t",
			  "clit",
			  "clitoris",
			  "clits",
			  "cnut",
			  "cock",
			  "cocksucker",
			  "cockface",
			  "cockhead",
			  "cockmunch",
			  "cockmuncher",
			  "cocks",
			  "cocksuck",
			  "cocksucked",
			  "cocksucker",
			  "cocksucking",
			  "cocksucks",
			  "cocksuka",
			  "cocksukka",
			  "cok",
			  "cokmuncher",
			  "coksucka",
			  "coon",
			  "cox",
			  "crap",
			  "cum",
			  "cummer",
			  "cumming",
			  "cums",
			  "cumshot",
			  "cunilingus",
			  "cunillingus",
			  "cunnilingus",
			  "cunt",
			  "cuntlick",
			  "cuntlicker",
			  "cuntlicking",
			  "cunts",
			  "cyalis",
			  "cyberfuc",
			  "cyberfuck",
			  "cyberfucked",
			  "cyberfucker",
			  "cyberfuckers",
			  "cyberfucking",
			  "d1ck",
			  "damn",
			  "dick",
			  "dickhead",
			  "dildo",
			  "dildos",
			  "dink",
			  "dinks",
			  "dirsa",
			  "dlck",
			  "dog-fucker",
			  "doggin",
			  "dogging",
			  "donkeyribber",
			  "doosh",
			  "duche",
			  "dyke",
			  "ejaculate",
			  "ejaculated",
			  "ejaculates",
			  "ejaculating",
			  "ejaculatings",
			  "ejaculation",
			  "ejakulate",
			  "f4nny",
			  "fag",
			  "fagging",
			  "faggitt",
			  "faggot",
			  "faggs",
			  "fagot",
			  "fagots",
			  "fags",
			  "fanny",
			  "fannyflaps",
			  "fannyfucker",
			  "fanyy",
			  "fatass",
			  "fcuk",
			  "fcuker",
			  "fcuking",
			  "feck",
			  "fecker",
			  "felching",
			  "fellate",
			  "fellatio",
			  "fingerfuck",
			  "fingerfucked",
			  "fingerfucker",
			  "fingerfuckers",
			  "fingerfucking",
			  "fingerfucks",
			  "fistfuck",
			  "fistfucked",
			  "fistfucker",
			  "fistfuckers",
			  "fistfucking",
			  "fistfuckings",
			  "fistfucks",
			  "flange",
			  "fook",
			  "fooker",
			  "fuck",
			  "fucka",
			  "fucked",
			  "fucker",
			  "fuckers",
			  "fuckhead",
			  "fuckheads",
			  "fuckin",
			  "fucking",
			  "fuckings",
			  "fuckingshitmotherfucker",
			  "fuckme",
			  "fucks",
			  "fuckwhit",
			  "fuckwit",
			  "fudgepacker",
			  "fuk",
			  "fuker",
			  "fukker",
			  "fukkin",
			  "fuks",
			  "fukwhit",
			  "fukwit",
			  "fux",
			  "fux0r",
			  "f_u_c_k",
			  "gangbang",
			  "gangbanged",
			  "gangbangs",
			  "gaylord",
			  "gaysex",
			  "goatse",
			  "God",
			  "god-dam",
			  "god-damned",
			  "goddamn",
			  "goddamned",
			  "hardcoresex",
			  "hell",
			  "heshe",
			  "hoar",
			  "hoare",
			  "hoer",
			  "homo",
			  "hore",
			  "horniest",
			  "horny",
			  "hotsex",
			  "jack-off",
			  "jackoff",
			  "jap",
			  "jerk-off",
			  "jism",
			  "jiz",
			  "jizm",
			  "jizz",
			  "kawk",
			  "knob",
			  "knobead",
			  "knobed",
			  "knobend",
			  "knobhead",
			  "knobjocky",
			  "knobjokey",
			  "kock",
			  "kondum",
			  "kondums",
			  "kum",
			  "kummer",
			  "kumming",
			  "kums",
			  "kunilingus",
			  "l3ich",
			  "l3itch",
			  "labia",
			  "lmfao",
			  "lust",
			  "lusting",
			  "m0f0",
			  "m0fo",
			  "m45terbate",
			  "ma5terb8",
			  "ma5terbate",
			  "masochist",
			  "master-bate",
			  "masterb8",
			  "masterbat",
			  "masterbat3",
			  "masterbate",
			  "masterbation",
			  "masterbations",
			  "masturbate",
			  "mo-fo",
			  "mof0",
			  "mofo",
			  "mothafuck",
			  "mothafucka",
			  "mothafuckas",
			  "mothafuckaz",
			  "mothafucked",
			  "mothafucker",
			  "mothafuckers",
			  "mothafuckin",
			  "mothafucking",
			  "mothafuckings",
			  "mothafucks",
			  "motherfuck",
			  "motherfucked",
			  "motherfucker",
			  "motherfuckers",
			  "motherfuckin",
			  "motherfucking",
			  "motherfuckings",
			  "motherfuckka",
			  "motherfucks",
			  "muff",
			  "mutha",
			  "muthafecker",
			  "muthafuckker",
			  "muther",
			  "mutherfucker",
			  "n1gga",
			  "n1gger",
			  "nazi",
			  "nob",
			  "nobhead",
			  "nobjocky",
			  "nobjokey",
			  "numbnuts",
			  "nutsack",
			  "orgasim",
			  "orgasims",
			  "orgasm",
			  "orgasms",
			  "p0rn",
			  "pawn",
			  "pecker",
			  "penis",
			  "penisfucker",
			  "phonesex",
			  "phuck",
			  "phuk",
			  "phuked",
			  "phuking",
			  "phukked",
			  "phukking",
			  "phuks",
			  "phuq",
			  "pigfucker",
			  "pimpis",
			  "piss",
			  "pissed",
			  "pisser",
			  "pissers",
			  "pisses",
			  "pissflaps",
			  "pissin",
			  "pissing",
			  "pissoff",
			  "poop",
			  "porn",
			  "porno",
			  "pornography",
			  "pornos",
			  "prick",
			  "pricks",
			  "pron",
			  "pube",
			  "pusse",
			  "pussi",
			  "pussies",
			  "pussy",
			  "pussys",
			  "rectum",
			  "retard",
			  "rimjaw",
			  "rimming",
			  "shit",
			  "sob",
			  "sadist",
			  "schlong",
			  "screwing",
			  "scroat",
			  "scrote",
			  "scrotum",
			  "semen",
			  "sex",
			  "sh",
			  "sht",
			  "sh1t",
			  "shag",
			  "shagger",
			  "shaggin",
			  "shagging",
			  "shemale",
			  "shi",
			  "shit",
			  "shitdick",
			  "shite",
			  "shited",
			  "shitey",
			  "shitfuck",
			  "shitfull",
			  "shithead",
			  "shiting",
			  "shitings",
			  "shits",
			  "shitted",
			  "shitter",
			  "shitters",
			  "shitting",
			  "shittings",
			  "shitty",
			  "skank",
			  "slut",
			  "sluts",
			  "smegma",
			  "smut",
			  "snatch",
			  "son-of-a-bitch",
			  "spac",
			  "spunk",
			  "s_h_i_t",
			  "t1tt1e5",
			  "t1tties",
			  "teets",
			  "teez",
			  "testical",
			  "testicle",
			  "tit",
			  "titfuck",
			  "tits",
			  "titt",
			  "tittie5",
			  "tittiefucker",
			  "titties",
			  "tittyfuck",
			  "tittywank",
			  "titwank",
			  "tosser",
			  "turd",
			  "tw4t",
			  "twat",
			  "twathead",
			  "twatty",
			  "twunt",
			  "twunter",
			  "v14gra",
			  "v1gra",
			  "vagina",
			  "viagra",
			  "vulva",
			  "w00se",
			  "wang",
			  "wank",
			  "wanker",
			  "wanky",
			  "whoar",
			  "whore",
			  "willies",
			  "willy",
			  "xrated",
			  "xxx"]
  
  #generates a codename from the given array of naughty words
  #NOTE: Does not generate codenames uniqueness. Uniqueness is checked when object is saved
  def generate_codename
    first_word = BADWORDS[rand(1..BADWORDS.count)]
    second_word = BADWORDS[rand(1..BADWORDS.count)]

    code = first_word + second_word

    self.codename = code
    return code
  end

 end
