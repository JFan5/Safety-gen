#!/usr/bin/env python3
"""
Load the SFT LoRA adapter and export a merged full-precision checkpoint.
"""
import logging
from unsloth import FastLanguageModel

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("merge_model")

ADAPTER_PATH = "/jfan5/sft_models/mistral_7b/four_scenarios500-1124"
OUTPUT_DIR = "/jfan5/sft_models/mistral_7b/four_scenarios500-1124-merged"


def main():
    logger.info(f"Loading LoRA adapter checkpoint: {ADAPTER_PATH}")
    model, tokenizer = FastLanguageModel.from_pretrained(
        ADAPTER_PATH,
        max_seq_length=4096,
        load_in_4bit=False,
        load_in_8bit=False,
    )

    logger.info("Switching model to inference mode for merge")
    FastLanguageModel.for_inference(model)

    logger.info(f"Merging and saving to {OUTPUT_DIR}")
    model.save_pretrained_merged(
        OUTPUT_DIR,
        tokenizer,
        save_method="merged_16bit",
    )
    logger.info("Merge completed successfully.")


if __name__ == "__main__":
    main()
