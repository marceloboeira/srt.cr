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
