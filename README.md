# Cadmium::Lang

`Lang` is a language detector for Crystal. It was trained using the [Bayes Classifier]() and is extreemely accurate (test results coming soon) even for very similar languages such as Russian and Ukranian (with a large enough sample size).

## Supported languages (116)

Abkhazian (abk), Afrikaans (af), Albanian (alb), English, Old (ca.450-1100) (ang), Arabic (ar), Official Aramaic (700-300 BCE) (arc), Assamese (asm), Asturian (ast), Avaric (ava), Azerbaijani (az), Bashkir (ba), Belarusian (bel), Bengali (bn), Bhojpuri (bho), Bosnian (bs), Burmese (my), Chechen (ce), Cornish (kw), Corsican (co), Crimean Tatar (crh), Kashubian (csb), Lower Sorbian (dsb), French (fr), Northern Frisian (frr), Friulian (fur), Georgian (ka), Gaelic (gd), Galician (gl), Manx (gv), Swiss German (gsw), Hawaiian (haw), Hebrew (he), Hindi (hi), Croatian (hr), Upper Sorbian (hsb), Igbo (ig), Iloko (ilo), Javanese (jv), Lojban (jbo), Japanese (ja), Kara-Kalpak (kaa), Kabyle (kab), Kalaallisut (kl), Kannada (kn), Kabardian (kbd), Central Khmer (khm), Kinyarwanda (rw), Komi (kv), Korean (ko), Karachay-Balkar (krc), Ladino (lad), Lao (lo), Lezghian (lez), Limburgan (li), Lingala (ln), Luxembourgish (lb), Lushai (lus), Macedonian (mk), Malayalam (ml), Maori (mi), Marathi (mr), Moksha (mdf), Minangkabau (min), Malagasy (mg), Maltese (mt), Mongolian (mn), Mirandese (mwl), Erzya (myv), Neapolitan (nap), Navajo (nav), Low German (nds), Nepal Bhasa (new), Norwegian Nynorsk (nn), Norwegian (no), Oriya (ori), Ossetian (os), Turkish, Ottoman (1500-1928) (ota), Pangasinan (pag), Pampanga (pam), Papiamento (pap), Pali (pi), Portuguese (pt), Romansh (roh), Russian (ru), Yakut (sah), Sicilian (scn), Scots (sco), Shan (shn), Northern Sami (se), Shona (sna), Sindhi (snd), Somali (so), Spanish (es), Sardinian (sc), Sranan Tongo (srn), Serbian (sr), Swahili (sw), Tamil (ta), Tatar (tat), Telugu (te), Tetum (tet), Thai (th), Tibetan (bo), Tok Pisin (tpi), Turkmen (tk), Turkish (tr), Udmurt (udm), Ukrainian (uk), Urdu (ur), Vietnamese (vi), Volapük (vo), Walloon (wa), Wolof (wo), Kalmyk (xal), Yiddish (yi), Yoruba (yo)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     cadmium_lang:
       github: cadmiumcr/cadmium_lang
   ```

2. Run `shards install`

## Usage

```crystal
require "cadmium_lang"

# by default language data will be loaded from the data/languages
# directory, however if you include this in a compiled binary you may
# have to set the path manually
lang = Cadmium::Lang.new

puts lang.detect("Название страны происходит от этнонима ") # => ru
puts lang.detect("Якщо сторінка була тут створена нещодавно") # => uk
```

## Development

Adding languages to the data set is easy. Put each language sample in its own file named `[iso-code].txt` (ex. `en.txt` for english) and place all examples in a folder. Then paste the following code into a crystal file and modify the constants.

```crystal
DATA_PATH = "path/to/data"
OUTPUT_FOLDER = "path/to/output"
LOAD_DATA = false

classifier = Cadmium::Lang::Classifier.new

# If true previous data will be loaded from the OUTPUT_FOLDER.
# Should be true for re-trains, false for first time.
if LOAD_DATA
  classifier.load(OUTPUT_FOLDER)
end

# Train the classifer on a directory full of data samples
classifier.train_on(DATA_PATH)

# Save the results
classifier.save(OUTPUT_FOLDER)
```

In the case of the standard language set used in this library the values should be (assuming your crystal file is located at the root of the project):

DATA_PATH: Anything. You need to make the folder.
OUTPUT_FOLDER: "data/languages"
LOAD_DATA: true

## Contributing

1. Fork it (<https://github.com/cadmiumcr/cadmium_lang/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Watson](https://github.com/watzon) - creator and maintainer
