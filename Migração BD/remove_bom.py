# Abre o arquivo JSON com BOM e lê seu conteúdo
with open("datadump_fixed.json", "r", encoding="utf-8-sig") as f:
    content = f.read()

# Escreve o conteúdo em um novo arquivo sem BOM
with open("datadump_nobom.json", "w", encoding="utf-8") as f:
    f.write(content)

print("Arquivo salvo sem BOM: datadump_nobom.json")
