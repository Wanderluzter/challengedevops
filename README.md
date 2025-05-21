# 🚀 Projeto DevOps - API .NET Containerizada

Este projeto faz parte do Challenge de DevOps & Cloud Computing, com foco em conteinerização, uso de Docker e deploy em ambiente de nuvem (Azure). A aplicação foi desenvolvida utilizando ASP.NET Core e exposta através de um container Docker.

---

## 🧩 Tecnologias Utilizadas

- ASP.NET Core
- Entity Framework Core
- Docker
- Azure CLI
- Banco de dados: H2 (ou Oracle, dependendo da sua escolha)
- GitHub
- Draw.io (Arquitetura)
- YouTube (Demonstração)

---

## 📦 Funcionalidades da API

A API implementa um CRUD completo para **duas entidades** com relacionamento.

### Entidades:
- `Produto`
- `Categoria`

### Rotas principais:

#### 🔹 Categoria

- `GET /api/categorias` – Listar todas as categorias  
- `GET /api/categorias/{id}` – Buscar categoria por ID  
- `POST /api/categorias` – Criar nova categoria  
- `PUT /api/categorias/{id}` – Atualizar categoria  
- `DELETE /api/categorias/{id}` – Deletar categoria  

#### 🔹 Produto

- `GET /api/produtos` – Listar todos os produtos  
- `GET /api/produtos/{id}` – Buscar produto por ID  
- `POST /api/produtos` – Criar novo produto  
- `PUT /api/produtos/{id}` – Atualizar produto  
- `DELETE /api/produtos/{id}` – Deletar produto  

---

## 🐳 Como Rodar com Docker

### 🔧 Pré-requisitos

- Docker instalado

### ▶️ Passos para execução local

```bash
1. Clone o repositório:
   # Clone o repositório
git clone https://github.com/seu-usuario/seu-repo.git
cd seu-repo

# Construa a imagem
docker build -t api-motos .

# Execute o container
docker run -d -p 5000:80 --name api-motos-container api-motos
```

Acesse a documentação da API:
👉 http://localhost:5000/swagger

☁️ Deploy na Nuvem (Azure) com Scripts
O deploy completo na Azure é realizado via scripts automatizados, incluídos neste repositório:

📁 Scripts Disponíveis
Script	Descrição
provisionar-vm.sh	Cria o grupo de recursos e a VM Linux via Azure CLI
instalar-docker.sh	Instala o Docker na VM após conexão SSH
deploy-api.sh	Transfere a imagem Docker para a VM e sobe o container

💡 Observação: você precisará configurar seu IP público no script ou passar como argumento.
