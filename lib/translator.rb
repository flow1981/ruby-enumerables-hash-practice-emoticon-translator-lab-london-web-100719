# require modules here
require 'yaml'

file_path='./lib/emoticons.yml'

def load_library(file_path)
  data = YAML.load_file(file_path)
  
  output={:get_meaning =>{},
        :get_emoticon =>{}
  }

  japanese_emoticons=japanese_emoti(data)
  english_meanings=english_transation(data)
  english_emoticons=english_emoti(data)

  output[:get_meaning]=Hash[japanese_emoticons.zip(english_meanings)]
  output[:get_emoticon]=Hash[english_emoticons.zip(japanese_emoticons)]
  
  output
end


def japanese_emoticons(data)
  result=[]
  data.each do |key, value|
    result.push(value[1])
  end
  result
end


def japanese_emoti(data)
  result=[]
  data.each do |key, value|
    result.push(value[1])
  end
  result
end

def english_emoti(data)
  result=[]
  data.each do |key, value|
    result.push(value[0])
  end
  result
end

def english_transation(data)
  result=[]
  data.each do |key, value|
    result.push(key)
  end
  result
end


def get_japanese_emoticon(file_path,emoticon)
  
  result="Sorry, that emoticon was not found"
  output=load_library(file_path)
  
  output[:get_emoticon].each do |english,japanese|
    if english==emoticon
      result=japanese
    end
  end
  
  result
end

def get_english_meaning(file_path,emoticon)
  
  result="Sorry, that emoticon was not found"
  output=load_library(file_path)
  #puts output
  
  output[:get_meaning].each do |japanese,meaning|
    if japanese==emoticon
      result=meaning
    end
  end
  
  result
end