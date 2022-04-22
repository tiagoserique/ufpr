

all: help


install:
	pip install -r requirements.txt


exec:
	python3 parcial-relaxada.py < entrada.in


help:
	@echo "======================== Ajuda ============================"
	@echo " [*] Para executar o programa, use: make exec"
	@echo " [*] Para instalar as dependências, use: make install"
	@echo " [*] Para limpar eventuais lixos, use: make clean"
	@echo "==========================================================="


clean:
	@echo "Limpeza"
	rm -rf __pycache__