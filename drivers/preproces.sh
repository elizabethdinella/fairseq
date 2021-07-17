SOURCE_LANG="input.methods"
TARGET_LANG="output.tests"

SOURCE_DICT="/home/edinella/methods2test/corpus/preprocessed/fm/dict.input.methods.txt"
TARGET_DICT="/home/edinella/methods2test/corpus/preprocessed/fm/dict.output.tests.txt"

FOCAL_METHOD="/home/edinella/examples/ex-2/method.java"
TEST="/home/edinella/examples/ex-2/test.java"

VOCAB_FILE="/home/edinella/fairseq/drivers/vocab.json"
MERGE_FILE="/home/edinella/fairseq/drivers/merges.txt"

DATA_PATH="/home/edinella/examples/ex-2"

python /home/edinella/fairseq/drivers/tokenize.py --input_file $TEST --vocab_file $VOCAB_FILE --merge_file $MERGE_FILE --out_file $DATA_PATH/test.$TARGET_LANG && \
python /home/edinella/fairseq/drivers/tokenize.py --input_file $FOCAL_METHOD --vocab_file $VOCAB_FILE --merge_file $MERGE_FILE --out_file $DATA_PATH/test.$SOURCE_LANG && \
cd $DATA_PATH && \
fairseq-preprocess --trainpref $DATA_PATH/test --srcdict $SOURCE_DICT --tgtdict $TARGET_DICT -s $SOURCE_LANG -t $TARGET_LANG \
&& cd data-bin \
&& cp /home/edinella/fairseq/drivers/mv_split.sh . \
&& bash mv_split.sh \
&& cd /home/edinella/fairseq/
