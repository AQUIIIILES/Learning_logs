import json

def fix_json_encoding(input_file, output_file):
    with open(input_file, "r", encoding="utf-8") as f:
        data = json.load(f)  # Carrega o JSON corretamente decodificado
    
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)  # Garante UTF-8 sem escape \u

fix_json_encoding("datadump.json", "datadump_fixed.json")
