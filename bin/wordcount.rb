#!/usr/bin/env ruby
#
# Generate a htaccess rule for each old blog entry from
# http://lescastcodeurs.com/yyyy/mm/slug to http://lescastcodeurs.com/blog/yyyy/mm/dd/slug
# Has to be manual as the day is unknown in the URL
#
exclude = ["http", "org", "lescastcodeurs", "a", "div", "com", "www", "de", "le", "href", "p", "episode", "les", "li",
"fr", "sur", "strong", "et", "en", "l", "nous", "net", "h3", "id", "la", "https", "mp3", "h2", "cast", "d", "2010",
"2011", "2009", "2012", "2013", "du", "pour", "des", "1", "un", "2", "author", "bernard", "title", "emmanuel", "entry",
"post", "span", "layout", "ou", "display", "libsyn", "on", "0", "est", "to", "10", "the", "s", "in", "mp3_length",
"6", "dans", "3", "index", "contactez", "groupe", "01", "12", "em", "05", "via", "contacter", "04", "for", "avec",
"t", "que", "ez", "traffic", "vous", "and", "7", "une", "si", "07", "lang", "pas", "plus", "par", "06", "enregistr",
"8", "app", "20", "c", "qui", "02", "telechargement", "e", "dons", "au", "pisode", "relation", "09", "it", "co",
"03", "home", "5", "emmanuelbernard", "ul", "php", "4", "amp", "r", "11", "uk", "08", "view", "of", "jroller", "is",
"29", "ce", "il", "je", "style", "son", "25", "thread_id", "qu", "26"]
words = Hash.new(0)
Dir.foreach("../_posts") { |file|
    if (file =~ /20.*/)
        File.open("../" + file).each do |line|
            line.scan(/\w+/) do |word|
                word = word.downcase
                if not exclude.include?(word)
                    words[word.downcase] += 1
                end
            end
        end
    end
}
words["cool"]=579
words = words.sort_by { |key,value| -value }.first 100
File.open("../wordcount.csv", 'w') { |file|
    words.each { |key,value|
        #file.write("" + key + "; " + value.to_s + "\n")
        puts "" + key + " (" + value.to_s + ")"
    }
}
File.open("../wordcount.txt", 'w') { |file|
    concatstr = ""
    words.each { |key,value|
        compound = (" " + key ) * value
        concatstr += " " + compound
    }
    file.write(concatstr)
}
