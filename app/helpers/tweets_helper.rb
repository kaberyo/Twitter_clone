module TweetsHelper
    def text_url_to_link_with_hashtags text
      URI.extract(text, ['http','https']).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
      text.gsub!(url, sub_text)
    end
    return text.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー、,０-９「」｢｣・?？？＆“”…Ａ-Ｚａ-ｚ@_`~:：;＜＞=>!"%&':;{}【】％／、。，．・：；？！゛゜´｀¨＾￣＿ヽヾゝゞ〃仝々〆〇ー―‐／＼～∥｜…‥‘’“”（）〔〕［］｛｝〈〉《》「」『』【】＋－±×÷＝≠＜＞≦≧∞∴♂♀°′″℃￥＄￠￡％＃＆＊＠§☆★○●◎◇◆□■△▲▽▼※〒→←↑↓〓\^\$\*\+\|\(\)-]+/){|word| link_to word, "/post/hashtag/#{word.delete("#")}"}.html_safe #ここはハッシュタグを認識する処理
  end
end
