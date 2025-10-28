# Curso-SQL
Esse projeto visa a pratica de comandos em SQL aprendidos no curso: SQL para Análise de Dados passando pelos principais conceitos e formas de manipulação  e tratamento de dados de diferentes tipos.

Para exercitar os comandos foram utilizados as seguintes plataformas:

🖥️
- PostgreSQL - interface pgAdmin 4
- Link para realizar a instalação do arquivo executavél e da interface: https://www.youtube.com/watch?v=L_2l8XTCPAE

- Google Gemini
- Link para acessar: https://gemini.google.com

- ⚒️ Descrição do projeto:

- Utilizando a plataforma Google Gemini, fiz um prompt simples para a geração das tabelas em CVS.
- Prompt: monte uma base de dados não muito grande sobre vendas com tabelas separadas seguindo as 3 formas normais e com cardinalidade efetiva em csv, quero usar o arquivo para treinar meu sql no postgre, faça uma lista de exercicios junto com o arquivo para que eu responda, ex: qual a contagem dos produtos mais vendidos... monte perguntas que eu consiga usar todas as tabelas

logo após a geração dos arquivos, realizei o dowload na maquína local onde também coloquei os scripts para a criação / importação das tabeas via SQL e posteriormente a geração do script dos comandos.

<img width="870" height="383" alt="image" src="https://github.com/user-attachments/assets/33e05a3a-9b19-4ac7-8bb5-80299a08c077" />

OBS: para importar os dados transforme os arquivos no padrão csv. - ex: abra uma das 4 tabelas, vá em "aarquivo" - "salvar como" - "procurar" (escolha a pasta que você criou para armazernar tudo) - "mude o formato para CSV"
<img width="1109" height="773" alt="image" src="https://github.com/user-attachments/assets/9ff8b249-1f9d-4fb0-8908-b8007e82cb51" />

Em seguida na interface do pgAdmin, crie as tabelas conforme seu script ou o arquivo (script_sql.sql)  

<img width="1919" height="1078" alt="image" src="https://github.com/user-attachments/assets/d5e3b089-e83e-4edd-a532-4ce85622ef76" />

Logo após a criação, rode o código e confira as tabelas na parte de "Schermas".

Para realizar a importação é simples, selecione uma das tabelas, clique com o botão direito e encontre a opção de Import/Export:
<img width="1917" height="1022" alt="image" src="https://github.com/user-attachments/assets/f455126b-a002-44b6-b7e3-e10ef7bb2008" />

Após essa opção certifique-se de manter o delimitador em (;) e a opçaõ de header habilitada
<img width="1040" height="768" alt="image" src="https://github.com/user-attachments/assets/eeff608e-bcf0-4f14-9d17-ad46cffc34dc" />

Passe o caminho da sua pasta local até seus arquivos e matenha o encoding como UTF-8
<img width="885" height="697" alt="image" src="https://github.com/user-attachments/assets/8a4b7a52-f56a-4dd9-838f-da8cb7e37806" />


🚀 Pronto !!!

Realize o processo novamente para todos os arquivos e tabelas criadas e comece a manipular os dados....

Para melhor agilidade do projeto não foi realizado o tratamento de dados, no prompt para Gemini as tavbelas ja vieram tratadas.



