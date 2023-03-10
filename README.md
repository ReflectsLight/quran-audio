## About

quran-audio is a utility for downloading recitations of the holy book, The Quran,
from [everyayah.com](https://everyayah.com). The content is provided as a set of MP3
files (one per ayah), and recitations from multiple authors are available to choose
from.

## Usage

```
Usage: quran-audio pull [OPTIONS]
  -a, --author NAME          An author's name (default: alafasy)
  -b, --bitrate BITRATE      An MP3 bitrate (default: highest available)
  -s, --surah SURAH          A comma-separated list of surahs (default: all surahs)
  -c, --cooldown NUMBER      A number of second(s) to wait between requests (default: 0.5)
  -l, --authors              Show the available authors
  -h, --help                 Show help
```

## Authors

The list of recitation authors:

* Mishari bin Rashed Alafasy
* Aziz Alilli
* Abdullah Awad Al Juhany
* Ahmad bin Ali Al-Ajmi

See [share/quran-audio/authors.json](share/quran-audio/authors.json) for more information
about the authors.

## Thanks

First and foremost, Alhamdulillah.

* Thanks to the recitation authors (listed above).
* Thanks to the [everyayah.com](https://everyayah.com) website
  for providing the audio files that this utility downloads.

## License

Public domain.
