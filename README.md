# Desafio Técnico - E-commerce

## Introdução

Este projeto foi desenvolvido como parte do desafio técnico da RD Station, consistindo em uma API para gerenciamento de um carrinho de compras de e-commerce. O desenvolvimento seguiu as diretrizes da RD Station, priorizando código limpo, legível e eficiente.

### Implementações feitas por:

- **Luciana Sena**
- **E-mail:** [contato@lucianasena.tech](mailto:contato@lucianasena.tech)
- **Link do Repositório:** [GitHub](https://github.com/coderlucianasena/tech-interview-backend-entry-level-main.git)

---

## O Desafio - Carrinho de Compras

### Funcionalidades Implementadas

#### 1. Registrar Produto no Carrinho

**Rota:** `POST /cart`

- Verifica se existe um carrinho ativo na sessão.
- Cria um novo carrinho caso não exista.
- Adiciona um produto ou incrementa sua quantidade, caso já exista no carrinho.

**Payload de Requisição:**
```json
{
  "product_id": 345,
  "quantity": 2
}
```

**Resposta:**
```json
{
  "id": 789,
  "products": [
    {
      "id": 645,
      "name": "Produto A",
      "quantity": 2,
      "unit_price": 1.99,
      "total_price": 3.98
    }
  ],
  "total_price": 3.98
}
```

---

#### 2. Listar Itens do Carrinho Atual

**Rota:** `GET /cart`

- Retorna os produtos adicionados ao carrinho, com informações detalhadas e o total geral.

**Resposta:**
```json
{
  "id": 789,
  "products": [
    {
      "id": 645,
      "name": "Produto A",
      "quantity": 2,
      "unit_price": 1.99,
      "total_price": 3.98
    }
  ],
  "total_price": 3.98
}
```

---

#### 3. Alterar a Quantidade de Produtos no Carrinho

**Rota:** `POST /cart/add_item`

- Localiza o produto no carrinho e atualiza a quantidade.
- Recalcula o total do carrinho.

**Payload de Requisição:**
```json
{
  "product_id": 1230,
  "quantity": 3
}
```

**Resposta:**
```json
{
  "id": 1,
  "products": [
    {
      "id": 1230,
      "name": "Produto X",
      "quantity": 3,
      "unit_price": 7.00,
      "total_price": 21.00
    }
  ],
  "total_price": 21.00
}
```

---

#### 4. Remover Produto do Carrinho

**Rota:** `DELETE /cart/:product_id`

- Remove o produto do carrinho e atualiza o total.

**Resposta de Sucesso:**
```json
{
  "id": 1,
  "products": [],
  "total_price": 0.00
}
```

---

#### 5. Excluir Carrinhos Abandonados

**Job:** `CartCleanupJob`

- Marca carrinhos como "abandonados" após 3 horas de inatividade.
- Remove carrinhos abandonados há mais de 7 dias.
- Job executado periodicamente via Sidekiq.

---

## Como Executar o Projeto

### Dependências

- **Ruby 3.3.1**
- **Rails 7.1.3.2**
- **PostgreSQL 16**
- **Redis 7.0.15**

### Passos

1. **Clone o Repositório**
   ```bash
   git clone https://github.com/coderlucianasena/tech-interview-backend-entry-level-main.git
   cd tech-interview-backend-entry-level-main
   ```

2. **Instale as Dependências**
   ```bash
   bundle install
   ```

3. **Configure o Banco de Dados**
   ```bash
   bundle exec rails db:create db:migrate
   ```

4. **Inicie o Redis**
   ```bash
   redis-server
   ```

5. **Inicie o Sidekiq**
   ```bash
   bundle exec sidekiq
   ```

6. **Inicie o Servidor**
   ```bash
   bundle exec rails server
   ```

7. Acesse a aplicação em `http://localhost:3000`.

---

## Testes

1. **Executar os Testes**
   ```bash
   bundle exec rspec
   ```

2. **Cobertura**
   - Testes foram adicionados para:
     - Adição de produtos ao carrinho.
     - Listagem de produtos.
     - Atualização de quantidade.
     - Remoção de produtos.
     - Gerenciamento de carrinhos abandonados.

---

## Dockerização (Opcional)

1. **Criação do Arquivo `docker-compose.yml`**
   - Inclui serviços para Rails, PostgreSQL e Redis.

2. **Subir os Contêineres**
   ```bash
   docker-compose up
   ```

3. **Acessar o Projeto**
   - Verifique o status dos serviços e acesse `http://localhost:3000`.

---

## Considerações Finais

Este projeto foi desenvolvido com foco em:

- Código limpo e legível.
- Cobertura de todos os casos de uso descritos no desafio.
- Implementação de um Job para gerenciamento de carrinhos abandonados.
- Testes para validar todas as funcionalidades.

Caso tenha dúvidas ou feedbacks, sinta-se à vontade para entrar em contato. 🚀
