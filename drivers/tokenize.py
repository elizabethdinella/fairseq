import sys
import argparse
from tokenizers import ByteLevelBPETokenizer

parser = argparse.ArgumentParser()
parser.add_argument("--input_file")
parser.add_argument("--out_file")

parser.add_argument("--vocab_file")
parser.add_argument("--merge_file")
args = parser.parse_args()


bpe = ByteLevelBPETokenizer(args.vocab_file, args.merge_file)
c = " ".join(open(args.input_file).read().split())

with open(args.out_file, "w") as f: 
    f.write(" ".join(bpe.encode(c).tokens))

