

import sys


ok = False
input = ""
output = ""

try:
	input = sys.argv[1]
	output = sys.argv[2]
	ok = True

except (IndexError):
	print("Faltam argumentos")
	print("Execute o programa da seguinte forma")
	print("python3 data_converter <caminho/arquivo_de_entrada>"
		" <caminho/nome_arquivo_de_saida>")

temp_lines = []

if ( ok ):
	with open(output, "w") as file:
		with open(input, "r") as file2:
			lines = file2.readlines()


			for line in lines:
				temp_line = line.split()
				for x in temp_line[1:]:
					x_index = temp_line.index(x)
					result = x.split(":")
					temp_line[x_index] = result[1]

				temp_lines.append(" ".join(temp_line)+"\n")


		
		number_of_lines = len(lines)
		number_of_features = len(temp_line) - 1
		
		file.write(f"{number_of_lines} {number_of_features}\n")

		file.writelines(temp_lines)

