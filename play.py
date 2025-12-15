import pyarrow as pa
import pyarrow.ipc as ipc

ARROW_PATH = "/jfan5/sft_data/pddl3_symbolized_four_scenarios/blocksworld.hf/data-00000-of-00001.arrow"


def read_arrow_table(path: str) -> pa.Table:
    """
    Read a HuggingFace Datasets Arrow shard.

    Some Arrow files are IPC *file* format, others are IPC *stream* format.
    Try file reader first, then fall back to stream reader.
    """
    with pa.memory_map(path, "r") as source:
        try:
            # IPC file format
            reader = ipc.open_file(source)
            return reader.read_all()
        except Exception:
            # IPC stream format
            source.seek(0)
            reader = ipc.open_stream(source)
            return reader.read_all()


table = read_arrow_table(ARROW_PATH)
print("=== Arrow shard loaded ===")
print("path:", ARROW_PATH)
print("schema:\n", table.schema)
print("num_rows:", table.num_rows, "num_columns:", table.num_columns)
print("\n=== first 5 rows ===")
print(table.slice(0, 5).to_pydict())

# Optional: load the whole HF dataset directory instead of a single shard
# from datasets import load_from_disk
# ds = load_from_disk("/jfan5/sft_data/pddl3_symbolized_four_scenarios/blocksworld.hf")
# print(ds)
# print(ds[0])