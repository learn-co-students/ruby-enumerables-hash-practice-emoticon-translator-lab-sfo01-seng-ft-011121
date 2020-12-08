require "yaml"

def load_library(file)
  hash = YAML.load_file(file)
  new_hash = {}
  hash.each do |emot, arr|
    new_hash[emot] = {
      :english => arr[0],
      :japanese => arr[1]
    }
  end
  new_hash
end

def get_japanese_emoticon(file, emot)
  hash = load_library(file)
  hash.each { |k, v| return hash[k][:japanese] if hash[k][:english] == emot }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emot)
  hash = load_library(file)
  hash.each { |k, v| return k if hash[k][:japanese] == emot }
  return "Sorry, that emoticon was not found"
end