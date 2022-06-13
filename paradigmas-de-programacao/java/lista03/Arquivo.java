import java.io.*;

class Arquivo {
	public static void gravar(String frase, String nomeArquivo) throws IOException{
		FileOutputStream arq = new FileOutputStream(nomeArquivo);

		ObjectOutputStream out = new ObjectOutputStream(arq);

		out.writeChars(frase);
		out.flush();
		out.close();
	}
}
