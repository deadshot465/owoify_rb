# frozen_string_literal: true

require 'structures/word'

O_TO_OWO = /o/.freeze
EW_TO_UWU = /ew/.freeze
HEY_TO_HAY = /([Hh])ey/.freeze
DEAD_TO_DED_UPPER = /Dead/.freeze
DEAD_TO_DED_LOWER = /dead/.freeze
N_VOWEL_T_TO_ND = /n[aeiou]*t/.freeze
READ_TO_WEAD_UPPER = /Read/.freeze
READ_TO_WEAD_LOWER = /read/.freeze
BRACKETS_TO_STARTRAILS_FORE = /[({<]/.freeze
BRACKETS_TO_STARTRAILS_REAR = /[)}>]/.freeze
PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_FIRST = /[.,](?![0-9])/.freeze
PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_SECOND = /[!;]+/.freeze
THAT_TO_DAT_UPPER = /That/.freeze
THAT_TO_DAT_LOWER = /that/.freeze
TH_TO_F_UPPER = /TH(?!E)/.freeze
TH_TO_F_LOWER = /[Tt]h(?![Ee])/.freeze
LE_TO_WAL = /le$/.freeze
VE_TO_WE_UPPER = /Ve/.freeze
VE_TO_WE_LOWER = /ve/.freeze
RY_TO_WWY = /ry/.freeze
RORL_TO_W_UPPER = /(?:R|L)/.freeze
RORL_TO_W_LOWER = /(?:r|l)/.freeze
LL_TO_WW = /ll/.freeze
VOWEL_OR_R_EXCEPT_O_L_TO_WL_UPPER = /[AEIUR]([lL])$/.freeze
VOWEL_OR_R_EXCEPT_O_L_TO_WL_LOWER = /[aeiur]l$/.freeze
OLD_TO_OWLD_UPPER = /OLD/.freeze
OLD_TO_OWLD_LOWER = /([Oo])ld/.freeze
OL_TO_OWL_UPPER = /OL/.freeze
OL_TO_OWL_LOWER = /([Oo])l/.freeze
LORR_O_TO_WO_UPPER = /[LR]([oO])/.freeze
LORR_O_TO_WO_LOWER = /[lr]o/.freeze
SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_UPPER = /([BCDFGHJKMNPQSTXYZ])([oO])/.freeze
SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_LOWER = /([bcdfghjkmnpqstxyz])o/.freeze
VORW_LE_TO_WAL = /[vw]le/.freeze
FI_TO_FWI_UPPER = /FI/.freeze
FI_TO_FWI_LOWER = /([Ff])i/.freeze
VER_TO_WER = /([Vv])er/.freeze
POI_TO_PWOI = /([Pp])oi/.freeze
SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL = /([DdFfGgHhJjPpQqRrSsTtXxYyZz])le$/.freeze
CONSONANT_R_TO_CONSONANT_W = /([BbCcDdFfGgKkPpQqSsTtWwXxZz])r/.freeze
LY_TO_WY_UPPER = /Ly/.freeze
LY_TO_WY_LOWER = /ly/.freeze
PLE_TO_PWE = /([Pp])le/.freeze
NR_TO_NW_UPPER = /NR/.freeze
NR_TO_NW_LOWER = /nr/.freeze
FUC_TO_FWUC = /([Ff])uc/.freeze
MOM_TO_MWOM = /([Mm])om/.freeze
ME_TO_MWE = /([Mm])e/.freeze
N_VOWEL_TO_NY_FIRST = /n([aeiou])/.freeze
N_VOWEL_TO_NY_SECOND = /N([aeiou])/.freeze
N_VOWEL_TO_NY_THIRD = /N([AEIOU])/.freeze
OVE_TO_UV_UPPER = /OVE/.freeze
OVE_TO_UV_LOWER = /ove/.freeze
HAHA_TO_HEHE_XD = /\b(ha|hah|heh|hehe)+\b/.freeze
THE_TO_TEH = /\b([Tt])he\b/.freeze
YOU_TO_U_UPPER = /\bYou\b/.freeze
YOU_TO_U_LOWER = /\byou\b/.freeze
TIME_TO_TIM = /\b([Tt])ime\b/.freeze
OVER_TO_OWOR = /([Oo])ver/.freeze
WORSE_TO_WOSE = /([Ww])orse/.freeze

FACES = [
  '(・`ω´・)', ';;w;;', 'owo', 'UwU', '>w<', '^w^', '(* ^ ω ^)',
  '(⌒ω⌒)', 'ヽ(*・ω・)ﾉ', '(o´∀`o)', '(o･ω･o)', '＼(＾▽＾)／',
  '(*^ω^)', '(◕‿◕✿)', '(◕ᴥ◕)', 'ʕ•ᴥ•ʔ', 'ʕ￫ᴥ￩ʔ', '(*^.^*)', '(｡♥‿♥｡)',
  'OwO', 'uwu', 'uvu', 'UvU', '(*￣з￣)', '(つ✧ω✧)つ', '(/ =ω=)/',
  '(╯°□°）╯︵ ┻━┻', '┬─┬ ノ( ゜-゜ノ)', '¯\_(ツ)_/¯'
].freeze

module Mapping

  MAP_O_TO_OWO = lambda do |input|
    replacement = rand(2).positive? ? 'owo' : 'o'
    input.replace(O_TO_OWO, replacement)
  end

  MAP_EW_TO_UWU = lambda do |input|
    input.replace(EW_TO_UWU, 'uwu')
  end

  MAP_HEY_TO_HAY = lambda do |input|
    input.replace(HEY_TO_HAY, '\1ay')
  end

  MAP_DEAD_TO_DED = lambda do |input|
    input = input.replace(DEAD_TO_DED_UPPER, 'Ded')
    input.replace(DEAD_TO_DED_LOWER, 'ded')
  end

  MAP_N_VOWEL_T_TO_ND = lambda do |input|
    input.replace(N_VOWEL_T_TO_ND, 'nd')
  end

  MAP_READ_TO_WEAD = lambda do |input|
    input = input.replace(READ_TO_WEAD_UPPER, 'Wead')
    input.replace(READ_TO_WEAD_LOWER, 'wead')
  end

  MAP_BRACKETS_TO_STAR_TRAILS = lambda do |input|
    input = input.replace(BRACKETS_TO_STARTRAILS_FORE, '｡･:*:･ﾟ★,｡･:*:･ﾟ☆')
    input.replace(BRACKETS_TO_STARTRAILS_REAR, '☆ﾟ･:*:･｡,★ﾟ･:*:･｡')
  end

  MAP_PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS = lambda do |input|
    num = rand * FACES.length
    index = num.floor
    input = input.replace_with_func_single(PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_FIRST, lambda { " #{FACES[index]}" })

    num = rand * FACES.length
    index = num.floor
    input.replace_with_func_single(PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_SECOND, lambda { " #{FACES[index]}" })
  end

  MAP_THAT_TO_DAT = lambda do |input|
    input = input.replace(THAT_TO_DAT_LOWER, 'dat')
    input.replace(THAT_TO_DAT_UPPER, 'Dat')
  end

  MAP_TH_TO_F = lambda do |input|
    input = input.replace(TH_TO_F_LOWER, 'f')
    input.replace(TH_TO_F_UPPER, 'F')
  end

  MAP_LE_TO_WAL = lambda do |input|
    input.replace(LE_TO_WAL, 'wal')
  end

  MAP_VE_TO_WE = lambda do |input|
    input = input.replace(VE_TO_WE_LOWER, 'we')
    input.replace(VE_TO_WE_UPPER, 'We')
  end

  MAP_RY_TO_WWY = lambda do |input|
    input.replace(RY_TO_WWY, 'wwy')
  end

  MAP_R_OR_L_TO_W = lambda do |input|
    input = input.replace(RORL_TO_W_LOWER, 'w')
    input.replace(RORL_TO_W_UPPER, 'W')
  end

  MAP_LL_TO_WW = lambda do |input|
    input.replace(LL_TO_WW, 'ww')
  end

  MAP_VOWEL_OR_R_EXCEPT_O_L_TO_WL = lambda do |input|
    input = input.replace(VOWEL_OR_R_EXCEPT_O_L_TO_WL_LOWER, 'wl')
    input.replace(VOWEL_OR_R_EXCEPT_O_L_TO_WL_UPPER, 'W\1')
  end

  MAP_OLD_TO_OWLD = lambda do |input|
    input = input.replace(OLD_TO_OWLD_LOWER, '\1wld')
    input.replace(OLD_TO_OWLD_UPPER, 'OWLD')
  end

  MAP_OL_TO_OWL = lambda do |input|
    input = input.replace(OL_TO_OWL_LOWER, '\1wl')
    input.replace(OL_TO_OWL_UPPER, 'OWL')
  end

  MAP_L_OR_R_O_TO_WO = lambda do |input|
    input = input.replace(LORR_O_TO_WO_LOWER, 'wo')
    input.replace(LORR_O_TO_WO_UPPER, 'W\1')
  end

  MAP_SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO = lambda do |input|
    input = input.replace(SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_LOWER, '\1wo')
    input.replace_with_func_multiple(SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_UPPER, lambda do |s1, s2|
      msg = s1
      msg += s2.upcase == s2 ? 'W' : 'w'
      msg += s2
      msg
    end)
  end

  MAP_V_OR_W_LE_TO_WAL = lambda do |input|
    input.replace(VORW_LE_TO_WAL, 'wal')
  end

  MAP_FI_TO_FWI = lambda do |input|
    input = input.replace(FI_TO_FWI_LOWER, '\1wi')
    input.replace(FI_TO_FWI_UPPER, 'FWI')
  end

  MAP_VER_TO_WER = lambda do |input|
    input.replace(VER_TO_WER, 'wer')
  end

  MAP_POI_TO_PWOI = lambda do |input|
    input.replace(POI_TO_PWOI, '\1woi')
  end

  MAP_SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL = lambda do |input|
    input.replace(SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL, '\1wal')
  end

  MAP_CONSONANT_R_TO_CONSONANT_W = lambda do |input|
    input.replace(CONSONANT_R_TO_CONSONANT_W, '\1w')
  end

  MAP_LY_TO_WY = lambda do |input|
    input = input.replace(LY_TO_WY_LOWER, 'wy')
    input.replace(LY_TO_WY_UPPER, 'Wy')
  end

  MAP_PLE_TO_PWE = lambda do |input|
    input.replace(PLE_TO_PWE, '\1we')
  end

  MAP_NR_TO_NW = lambda do |input|
    input = input.replace(NR_TO_NW_LOWER, 'nw')
    input.replace(NR_TO_NW_UPPER, 'NW')
  end

  MAP_FUC_TO_FWUC = lambda do |input|
    input.replace(FUC_TO_FWUC, '\1wuc')
  end

  MAP_MOM_TO_MWOM = lambda do |input|
    input.replace(MOM_TO_MWOM, '\1wom')
  end

  MAP_ME_TO_MWE = lambda do |input|
    input.replace(ME_TO_MWE, '\1we')
  end

  MAP_N_VOWEL_TO_NY = lambda do |input|
    input = input.replace(N_VOWEL_TO_NY_FIRST, 'ny\1')
    input = input.replace(N_VOWEL_TO_NY_SECOND, 'Ny\1')
    input.replace(N_VOWEL_TO_NY_THIRD, 'NY\1')
  end

  MAP_OVE_TO_UV = lambda do |input|
    input = input.replace(OVE_TO_UV_LOWER, 'uv')
    input.replace(OVE_TO_UV_UPPER, 'UV')
  end

  MAP_HAHA_TO_HEHE_XD = lambda do |input|
    input.replace(HAHA_TO_HEHE_XD, 'hehe xD')
  end

  MAP_THE_TO_TEH = lambda do |input|
    input.replace(THE_TO_TEH, '\1eh')
  end

  MAP_YOU_TO_U = lambda do |input|
    input = input.replace(YOU_TO_U_UPPER, 'U')
    input.replace(YOU_TO_U_LOWER, 'u')
  end

  MAP_TIME_TO_TIM = lambda do |input|
    input.replace(TIME_TO_TIM, '\1im')
  end

  MAP_OVER_TO_OWOR = lambda do |input|
    input.replace(OVER_TO_OWOR, '\1wor')
  end

  MAP_WORSE_TO_WOSE = lambda do |input|
    input.replace(WORSE_TO_WOSE, '\1ose')
  end
end