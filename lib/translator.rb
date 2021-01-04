require "yaml"
require 'pry'

def load_library(file)
  hash = YAML.load_file(file)
  new_hash = {}
  hash.each do |k, v|
    new_hash[k] = {
      english: v[0],
      japanese: v[1]
    }
  end
  new_hash
end

def get_english_meaning(file, emot)
  hash = load_library(file)
  hash.each do |mood, langs|
    return mood if langs[:japanese] == emot
  end
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file, emot)
  hash = load_library(file)
  hash.each do |mood, langs|
    return langs[:japanese] if emot == langs[:english] 
  end
  return "Sorry, that emoticon was not found"
end