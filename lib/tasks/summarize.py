from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.lsa import LsaSummarizer
import sys

def summarize_description(text, sentences_count):
  parser = PlaintextParser.from_string(text, Tokenizer("english"))
  summarizer = LsaSummarizer()
  summary = summarizer(parser.document, sentences_count)
  return " ".join(str(sentence) for sentence in summary)

if __name__ == "__main__":
    text = sys.argv[1]
    sentences_count = int(sys.argv[2])
    print(summarize_text(text, sentences_count))
