<p align="center">
الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِي
</p>

## About

quran-audio is a command-line utility that
can download recitations of The Noble Quran from
[al-quran-audio.reflectslight.io](https://al-quran-audio.reflectslight.io).
The recitations are provided in the MP3 format with
one MP3 file per ayah and a *minimum* bitrate of
128kbps.

## share/

The command-line utility attempts to download MP3 files
relative to the `~/.local/share/quran-audio/` directory.
A single, full recitation of The Noble Quran typically
ranges from 2.5GB to 2.8GB in size.	Each recitation is
organized per this directory structure:

* **~/.local/share/quran-audio/mp3/alafasy/** <br>
  Contains recitations by Mishari bin Rashed Alafasy
* **~/.local/share/quran-audio/mp3/alajmi/** <br>
  Contains recitations by Ahmad bin Ali Al-Ajmi
* **~/.local/share/quran-audio/mp3/yassin/** <br>
  Contains recitations by Sahl Yassin
* **~/.local/share/quran-audio/mp3/rifai/** <br>
  Contains recitations by Hani ar-Rifai

## Examples

The following examples demonstrate how to use the quran-audio
command-line utility to download particular recitations, and
list available recitations as well:

    ##
	# Download recitations
	user@localhost$ quran-audio pull -r alafasy
	user@localhost$ quran-audio pull -r rifai

    ##
    # List available recitations
	user@localhost$ quran-audio ls

## Install

quran-audio is available via rubygems.org

    gem install quran-audio

## Credit

**Recitations**

* Mishari bin Rashed Alafasy
* Ahmad bin Ali Al-Ajmi
* Sahl Yassin
* Hani ar-Rifai

**Sources**

* The [everyayah.com](https://everyayah.com) website

## See also

* [al-quran.reflectslight.io](https://al-quran.reflectslight.io)
* [al-quran-audio.reflectslight.io](https://al-quran-audio.reflectslight.io)

## License

The "source code" is released under the [GPL](./LICENSE) license
<br>
Copyright for the recitations belongs to the reciters
