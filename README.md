# srt.cr [![Build Status](https://travis-ci.org/marceloboeira/srt.cr.svg?branch=master)](https://travis-ci.org/marceloboeira/srt.cr)
> Generate and Parse SRT files

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  srt:
    github: marceloboeira/srt.cr
```

## Usage

### Parsing

```crystal
require "str"

subtitle = STR::File.parse(File.read("lost-s01e01-pilot.srt"))

p subtitle.lines.first.text
# =>  Help me!
```

## Roadmap

- Benchmarks
- Improve parsing
- Store errors (Warning lines)
- Timeshift (+1ms, -2s)
- Line positioning format (`00:10:30,796 --> 00:10:33,799 X1:117 X2:619 Y1:042 Y2:428`)

Found a bug? Want to contribute? Take a look at [CONTRIBUTING.md](CONTRIBUTING.md).
