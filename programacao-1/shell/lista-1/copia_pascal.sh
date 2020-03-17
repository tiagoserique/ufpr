#!/bin/bash

pushd ~
	mkdir Pascal2C
	find -name '*.pas' -exec \cp {} ./Pascal2C \; 
	echo "arquivos copiados: "
	ls Pascal2C
	NUM=$( ls Pascal2C | wc -l )
	echo "Numero de arquivos copiados: ${NUM}"
popd
