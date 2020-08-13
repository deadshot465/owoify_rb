# frozen_string_literal: true

require 'utility/mapping'

SPECIFIC_WORD_MAPPING_LIST = [
  Mapping::MAP_FUC_TO_FWUC, Mapping::MAP_MOM_TO_MWOM, Mapping::MAP_TIME_TO_TIM, Mapping::MAP_ME_TO_MWE,
  Mapping::MAP_N_VOWEL_TO_NY, Mapping::MAP_OVER_TO_OWOR, Mapping::MAP_OVE_TO_UV, Mapping::MAP_HAHA_TO_HEHE_XD,
  Mapping::MAP_THE_TO_TEH, Mapping::MAP_YOU_TO_U, Mapping::MAP_READ_TO_WEAD, Mapping::MAP_WORSE_TO_WOSE
].freeze

UVU_MAPPING_LIST = [
  Mapping::MAP_O_TO_OWO, Mapping::MAP_EW_TO_UWU, Mapping::MAP_HEY_TO_HAY, Mapping::MAP_DEAD_TO_DED,
  Mapping::MAP_N_VOWEL_T_TO_ND
].freeze

UWU_MAPPING_LIST = [
  Mapping::MAP_BRACKETS_TO_STAR_TRAILS, Mapping::MAP_PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS,
  Mapping::MAP_THAT_TO_DAT, Mapping::MAP_TH_TO_F, Mapping::MAP_LE_TO_WAL, Mapping::MAP_VE_TO_WE, Mapping::MAP_RY_TO_WWY,
  Mapping::MAP_R_OR_L_TO_W
].freeze

OWO_MAPPING_LIST = [
  Mapping::MAP_LL_TO_WW, Mapping::MAP_VOWEL_OR_R_EXCEPT_O_L_TO_WL, Mapping::MAP_OLD_TO_OWLD,
  Mapping::MAP_OL_TO_OWL, Mapping::MAP_L_OR_R_O_TO_WO, Mapping::MAP_SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO,
  Mapping::MAP_V_OR_W_LE_TO_WAL, Mapping::MAP_FI_TO_FWI, Mapping::MAP_VER_TO_WER, Mapping::MAP_POI_TO_PWOI,
  Mapping::MAP_SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL, Mapping::MAP_CONSONANT_R_TO_CONSONANT_W,
  Mapping::MAP_LY_TO_WY, Mapping::MAP_PLE_TO_PWE, Mapping::MAP_NR_TO_NW
].freeze
