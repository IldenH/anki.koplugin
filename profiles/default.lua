-- /mnt/onboard/.adds/koreader/plugins/anki.koplugin/profiles/default.lua
return {
    ["allow_dupes"] = true,
    ["audio_field"] = "Audio",
    ["context_field"] = "Sentence",
    ["custom_tags"] = {
        [1] = "needswork",
    },
    ["deckName"] = "日本語::Sentence Mining",
    ["def_field"] = "Glossary",
    ["dupe_scope"] = "deck",
    ["enabled_extensions"] = {
        [1] = "EXT_kana_populator.lua",
        [2] = "EXT_dict_word_lookup.lua",
        ["EXT_dict_word_lookup.lua"] = true,
        ["EXT_kana_populator.lua"] = true,
    },
    ["meta_field"] = "",
    ["modelName"] = "Sentence Mining Card",
    ["next_sentence_count"] = 1,
    ["prev_sentence_count"] = 1,
    ["url"] = "http://10.0.0.26:8765",
    ["word_field"] = "Word",
}
