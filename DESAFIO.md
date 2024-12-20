# Desafio Técnico - API de Carrinho de Compras

## Visão Geral
Este projeto implementa uma API de gerenciamento de carrinho de compras para um e-commerce, seguindo os princípios de Clean Code e boas práticas de desenvolvimento. O objetivo é garantir clareza, funcionalidade e facilidade de manutenção, alinhado aos valores da RD Station.

---

## Funcionalidades

### 1. Registrar Produto no Carrinho
**Rota:** `POST /cart`
- Adiciona um produto ao carrinho. Se o carrinho não existir, ele é criado.
- **Payload:**
  ```json
  {
    "product_id": 345,
    "quantity": 2
  }
  ```
- **Resposta:**
  ```json
  {
    "id": 789,
    "products": [
      {
        "id": 645,
        "name": "Nome do produto",
        "quantity": 2,
        "unit_price": 1.99,
        "total_price": 3.98
      }
    ],
    "total_price": 7.96
  }
  ```

### 2. Listar Itens do Carrinho Atual
**Rota:** `GET /cart`
- Retorna todos os produtos no carrinho atual.
- **Resposta:**
  ```json
  {
    "id": 789,
    "products": [
      {
        "id": 645,
        "name": "Nome do produto",
        "quantity": 2,
        "unit_price": 1.99,
        "total_price": 3.98
      }
    ],
    "total_price": 7.96
  }
  ```

### 3. Alterar a Quantidade de Produtos no Carrinho
**Rota:** `POST /cart/add_product`
- Atualiza a quantidade de um produto no carrinho.
- **Payload:**
  ```json
  {
    "product_id": 1230,
    "quantity": 1
  }
  ```
- **Resposta:**
  ```json
  {
    "id": 1,
    "products": [
      {
        "id": 1230,
        "name": "Nome do produto X",
        "quantity": 2,
        "unit_price": 7.00,
        "total_price": 14.00
      }
    ],
    "total_price": 23.90
  }
  ```

### 4. Remover Produto do Carrinho
**Rota:** `DELETE /cart/:product_id`
- Remove um produto do carrinho.
- **Resposta em caso de sucesso:**
  ```json
  {
    "id": 1,
    "products": [],
    "total_price": 0.00
  }
  ```
- **Resposta em caso de erro:**
  ```json
  {
    "error": "Produto não encontrado no carrinho"
  }
  ```

### 5. Excluir Carrinhos Abandonados
- Um Job verifica carrinhos sem interação há mais de 3 horas e os marca como "abandonados".
- Carrinhos abandonados por mais de 7 dias são removidos automaticamente.

---

## Como Configurar

### Dependências
- **Ruby:** 3.3.1
- **Rails:** 7.1.3.2
- **PostgreSQL:** 16
- **Redis:** 7.0.15

### Instalação
1. Instale as dependências:
   ```bash
   bundle install
   ```
2. Configure o banco de dados:
   ```bash
   bundle exec rails db:create db:migrate
   ```
3. Inicie o Sidekiq:
   ```bash
   bundle exec sidekiq
   ```
4. Inicie o servidor:
   ```bash
   bundle exec rails server
   ```

---

## Testes

### Executar Testes
- Execute os testes com RSpec:
  ```bash
  bundle exec rspec
  ```
- Certifique-se de que todos os casos de uso estão cobertos e que os testes estão passando.

### Adicionar Novos Testes
- Use **FactoryBot** para criar objetos nos testes.
- Adicione cenários para:
  - Casos de sucesso (happy path).
  - Casos de erro (ex.: produto não encontrado).

---

## Dockerização

### Configuração do Docker Compose
1. Certifique-se de que o arquivo `docker-compose.yml` está configurado para:
   - Aplicativo web (Rails).
   - Banco de dados (PostgreSQL).
   - Redis (para o Sidekiq).
2. Inicie os serviços:
   ```bash
   docker-compose up
   ```
3. Verifique se a aplicação está funcionando corretamente no ambiente Docker.

---

## Considerações Finais

### Alinhamento aos Valores da RD Station
- **Clean Code:** Prioriza a clareza e organização do código.
- **Customer First:** Tratamento de erros com mensagens claras.
- **Excelência:** Testes robustos e soluções eficientes.
- **Lean:** Evita complexidade desnecessária, focando em funcionalidades essenciais.

### Repositório
Suba o projeto para um repositório público (GitHub ou GitLab) e inclua o link no README. Certifique-se de que todos os arquivos necessários estejam versionados.

---
