# Respostas para perguntas do pset1

1. O que são sistemas de controles de versões? Por que são importantes?  
    **Resposta:** Eles são, como o nome já diz, sistemas que permitem o controle de versões de um arquvo, permitindo a vizualização e gerenciamento de versões anteriores. Eles são fundamentais para garantir a possibilidade de voltar a versões anteriores e descobrir bugs.

2. Qual a diferença entre o Git e o GitHub? Como eles estão relacionados?
É possível usar um sem o outro?  
    **Resposta:** Git é o software/sistema de controle de versão, e o GitHub é um site onde você pode compartilhar todas as versões do seu programa que foram salvas utilizando o Git, e também deixar todas as versões salvas lá. É possível utilizar o Git sem o Github, pois ele fica apenas no seu computador, mas não é possível utilizar o Github sem o Git, já que ele depende das versões salvas pelo git para funcionar.

3. O Git é um sistema distribuído de controle de versões. O que significa isso?  
**Resposta:** Isso significa que no git cada usuários possui um repositório próprio e específico pra cada um, onde no sistema cental existe um repositório central para todos os usuários

4. Existem alguns errinhos no projeto HR ilustrado acima (principalmente
em relação às cardinalidades dos relacionamentos e em relação à obrigatoriedade das
chaves estrangeiras). Identifique quais são esses erros, explique o que está errado e
conserte os erros se for necessário.  
**Resposta:** '#'

5. Alguma tabela do projeto representa um relacionamento do tipo N:N?
Se sim, identifique a tabela e explique porque é um relacionamento N:N; Se não,
explique porque não há relacionamentos N:N neste projeto.  
**Resposta:** Sim, na tabela historico_cargos. A relação N:N acontece entre as tabelas departamentos e empregados, onde um empregado pode mudar de departamento dentro de um cargo, ou mudar de cargo dentro de um departamento.

6. Pelo projeto apresentado é possível que um determinado empregado
seja o gerente de zero, um ou mais departamentos. Se eu quisesse impor uma regra
que diz que um empregado só pode ser gerente de, no máximo, um departamento,
o que eu teria que fazer no projeto? O que eu teria que criar no banco de dados para
impor essa restrição? Por quê?  
**Resposta:** Seria necessário fazer com que a coluna 'id_gerente' da tabela 'departamentos' se torne uma primary key ou uma chave alternativa (única), por que assim seria necessário que um departamento tivesse gerente (por primary keys não poderem ser NULL), e teria apenas 1 gerente por departamento (por primary keys serem únicas).

7. Por que os relacionamentos entre as tabelas estão representados com
linhas pontilhadas? O que isso representa? Por que foi representado assim?  
**Resposta:**

8. Qual é o único tipo de relacionamento que pode guardar dados? Por
quê? Existe algum relacionamento assim nesse projeto? Se não existir, você sugeriria trocar alguns dos relacionamentos existentes para melhorar o projeto?  
**Resposta>**

9. Explique o relacionamento da tabela empregados com ela mesma? É
um erro? É correto? Por quê?  
**Resposta:** Este relacionamento está correto. Ele serve para indicar que uma pessoa, que possui os dados na mesma tabela como todas as outras, é o valor a ser preenchido na coluna, ou seja, uma pessoa na tabela empregados possui um gerente que também está na tabela empregados.

10. Qual a diferença entre banco de dados, usuário e esquema no PostgreSQL?  
**Resposta:** Banco de dados é a parte geral do projeto, onde contém todos os arquivos, esquemas e informações das tabelas. Usuário é a "conta" em que será digitado e requisitado os códigos e informações. Esquema é o lugar onde ficam armazenados as tabelas, linhas, informações, 'constraints', e etc, basicamente todas as informações que envolvem tabelas do banco de dados.

11. Por que um esquema é importante?  
**Resposta** Ele é importante para permitir que vários usuários possam utilizar o banco de dados sem que uma ação de um usuário interfira com outro.
12. Se você não definir um esquema específico, onde os objetos do banco
de dados (tabelas, relacionamentos, dados, etc.) serão gravados? Isso é bom ou
ruim? Por que?  
**Resposta** Eles serão gravados no esquema público. Isso é ruim pois esse é o esquema padrão e geral, portanto alguma alteração nesse esquema irá afetar todos os outros usuários que estejam conectado nele, portanto o ideal é que cada um utilize em situações normais o próprio esquema.
13. Agora que você já implementou o projeto no PostgreSQL, tem alguma
sugestão de melhoria a fazer para o projeto? Como ele poderia ser melhorado?  
**Resposta:** Algumas possíveis melhoras para ele seria a remoção da tabela regiões e talvez até a remoção da tabela países, pois as informações contidas nessas tabelas poderiam facilmente serem incluidas direto na tabela localizações.

14. Faça uma comparação dos SGBD que você utilizou. Quais as vantagnes e desvantagens de cada um? Quem tem a melhor documentação?  
**Resposta:**
15. Como você acha que foi seu desempenho neste PSet? Como você foi
buscando as informações necessárias e lendo as documentações dos SGBD? Você
aproveitou a oportunidade e buscou ajuda dos monitores?  
**Resposta**
