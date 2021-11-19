class TitleValidator < ActiveModel::Validator

  def validate(record)
    return record.errors[:title] << 'Title can not be blanc' if record.title == nil || record.title.length == 0
    catchy_words = ["Won't Believe", "Secret", "Guess"]
    contains_catchy_word = false
    contains_catchy_word if record.title.match?(/Top d+/)
    catchy_words.each do |w|
      break if contains_catchy_word == true
      contains_catchy_word = true if record.title.include?(w)
    end
    unless contains_catchy_word
      record.errors[:title] << 'Title is not catchy'
    end
  end

end