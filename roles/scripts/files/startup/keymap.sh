#!/usr/bin/env zsh

# -- KEY CODES -- #
left_control="0x7000000E0"
left_shift="0x7000000E1"
left_alt="0x7000000E2"
left_command="0x7000000E3"
right_control="0x7000000E4"
right_shift="0x7000000E5"
right_alt="0x7000000E6"
right_command="0x7000000E7"

# -- SET KEYMAPS -- # 
keymap_cmd_opt() {
  hidutil property --set '{"UserKeyMapping":[
    {
      "HIDKeyboardModifierMappingSrc": '"$left_command"',
      "HIDKeyboardModifierMappingDst": '"$left_alt"'
    },
    {
      "HIDKeyboardModifierMappingSrc": '"$left_alt"',
      "HIDKeyboardModifierMappingDst": '"$left_command"'
    }
  ]}'
}

# -- REMOVE KEYMAPS -- #
remove_keymaps() {
  hidutil property --set '{"UserKeyMapping":[]}'
}

# -- OUTPUT KEYMAPS -- #
hidutil property --get "UserKeyMapping"

# -- EXECUTE FUNCTIONS -- #
keymap_cmd_opt
# remove_keymaps
