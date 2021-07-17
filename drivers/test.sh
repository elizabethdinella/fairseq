DATA_PATH="/home/edinella/examples/ex-2/"
MODEL="/home/edinella/model/checkpoint.pt"

VOCAB_FILE="/home/edinella/fairseq/drivers/vocab.json"
MERGE_FILE="/home/edinella/fairseq/drivers/merges.txt"


INPUT_TO_SCORE="/home/edinella/examples/ex-2/test.java"

python /home/edinella/fairseq/drivers/tokenize.py --input_file $INPUT_TO_SCORE --vocab_file $VOCAB_FILE --merge_file $MERGE_FILE --out_file $DATA_PATH/input_to_score.txt && \
cd $DATA_PATH && \
fairseq-generate data-bin --path $MODEL --target-lang output.tests --source-lang input.methods --input-file $DATA_PATH/input_to_score.txt && cd /home/edinella/fairseq 
