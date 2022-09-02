
-- Nome;
-- Rua; Numero; Bairro; Cep; Email; Telefone; Endereco composto de Rua, Numero, Bairro e Cep; Clente
-- composto de Nome, Endereco, Telefone e Email.

type Nome = String
type Rua = String
type Numero = Int
type Bairro = String
type Cep = String
type Email = String
type Telefone = String
type Endereco = (Rua, Numero, Bairro, Cep)
type Cliente = (Nome, Endereco, Telefone, Email)
