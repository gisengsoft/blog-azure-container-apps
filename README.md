# Blog Azure Container Apps - Gilson Silva

Um projeto demonstrativo de blog implementado com Azure Container Apps, mostrando uma arquitetura moderna de aplicação web em contêineres na nuvem Microsoft Azure.

## 📋 Visão Geral do Projeto

Este projeto implementa uma aplicação de blog utilizando Azure Container Apps. A aplicação é uma SPA (Single Page Application) com frontend em HTML/JS que se comunica com serviços backend hospedados em contêineres. O projeto demonstra a implementação de uma arquitetura moderna usando serviços em nuvem da Microsoft.

![Arquitetura do Projeto](https://exemplo.com/arquitetura.png)

## 🏗️ Estrutura do Projeto

```
BlogConteinerApps/
├── Blog/                   # Diretório auxiliar
├── create-post.html        # Página para criação de novos posts
├── dockerfile              # Configuração do contêiner NGINX
├── index.html              # Página inicial com listagem de posts
├── post-detail.html        # Página de detalhes do post com comentários
├── scripts.ps1             # Scripts PowerShell para deployment no Azure
├── example.secrets.ps1     # Template para configuração de credenciais
└── .gitignore              # Configuração de arquivos ignorados pelo git
```

## 💻 Componentes da Aplicação

### Frontend

- **Interface simples e responsiva** usando Bootstrap 5
- **Armazenamento local** (localStorage) para persistência de dados temporária
- **Três páginas principais**:
  - Lista de posts na página inicial
  - Formulário para criação de novos posts
  - Visualização detalhada de posts com seção de comentários

### Infraestrutura

- **Contêinerização** com Docker e NGINX
- **Hospedagem** no Azure Container Apps
- **Scripts automatizados** para implantação
- **Gerenciamento de segredos** com arquivos externos ao controle de versão

## 🛠️ Funcionalidades da Aplicação

- **Listar Posts**: Na página inicial, são exibidos todos os posts cadastrados
- **Criar Posts**: Formulário para adicionar novos posts ao blog
- **Visualizar Post**: Página detalhada com conteúdo completo do post e comentários
- **Comentar**: Possibilidade de adicionar comentários a um post específico

## 🔄 Como Funciona

### 1. Conteinerização com Docker

O Dockerfile atual configura o NGINX para servir os arquivos estáticos:

```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80
```

### 2. Implantação no Azure

A implantação é realizada através de scripts PowerShell que:

1. Criam um Azure Container Registry
2. Fazem build e push da imagem Docker
3. Criam um ambiente Azure Container Apps
4. Implantam a aplicação com acesso externo

### 3. Fluxo de Dados

- Os posts são armazenados temporariamente no localStorage do navegador
- Na implementação futura, serão armazenados em banco de dados na nuvem
- O NGINX serve o frontend e roteia requisições para os microsserviços

## 🚀 Como Executar

### Localmente com Docker

```bash
# Construir a imagem
docker build -t blog-app .

# Executar o contêiner
docker run -d -p 8080:80 blog-app

# Acesse em seu navegador
# http://localhost:8080
```

### Implantação no Azure

1. Configure suas credenciais
   ```bash
   cp example.secrets.ps1 secrets.ps1
   # Edite o arquivo secrets.ps1 com suas credenciais reais
   ```

2. Execute o script de implantação
   ```powershell
   ./scripts.ps1
   ```

> **⚠️ IMPORTANTE**: Nunca adicione o arquivo secrets.ps1 ao controle de versão. Ele já está incluído no .gitignore.

## 📊 Desafios e Soluções

| Desafio               | Solução                                                                                                   |
| --------------------- | --------------------------------------------------------------------------------------------------------- |
| Permissão para ACR    | Adicionados parâmetros de autenticação `--registry-server`, `--registry-username` e `--registry-password` |
| Persistência de dados | Implementação inicial com localStorage (a ser substituída por solução em nuvem)                           |
| Roteamento simples    | Implementado com links entre páginas HTML                                                                 |
| Segurança de secrets  | Implementado arquivo separado para credenciais, excluído do controle de versão                            |

## 📈 Melhorias Futuras

### 1. Arquitetura de Microsserviços
- **Separar backend em serviços**: ListPost, CreatePost e Comments
- **Implementar API Gateway**: Utilizar NGINX como gateway para rotear requisições
- **Diagrama de arquitetura atualizado**:
  ```
  Cliente -> NGINX (Gateway) -> [ListPost Service, CreatePost Service, Comment Service]
  ```

### 2. Persistência de Dados em Nuvem
- **Azure Cosmos DB**: Substituir localStorage por banco de dados NoSQL
- **Azure Storage**: Armazenar imagens e anexos
- **Entity Framework Core**: ORM para acesso aos dados

### 3. Segurança e Monitoramento
- **Azure Active Directory B2C**: Autenticação de usuários
- **Application Insights**: Monitoramento em tempo real
- **Log Analytics**: Análise centralizada de logs
- **Alertas e notificações**: Configurar alertas para comportamentos anormais

### 4. DevOps e CI/CD
- **GitHub Actions**: Pipeline de CI/CD automatizado
- **Azure DevOps**: Gestão de tarefas e integração contínua
- **Ambientes distintos**: Desenvolvimento, homologação e produção
- **Testes automatizados**: Unitários e integração

### 5. Escalabilidade
- **Auto-scaling**: Configurar regras de escala baseadas em métricas
- **Cache**: Implementar Redis Cache para melhorar performance
- **CDN**: Distribuir conteúdo estático em edge locations

### 6. UX/UI
- **Framework JavaScript**: Implementar React ou Vue.js
- **PWA**: Transformar em Progressive Web App
- **Design responsivo avançado**: Melhorar experiência em dispositivos móveis

## 🔧 Tecnologias Utilizadas

- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5
- **Armazenamento**: localStorage (temporário)
- **Contêinerização**: Docker, NGINX
- **Cloud**: Azure Container Apps, Azure Container Registry
- **Automação**: PowerShell, Azure CLI
- **Controle de Versão**: Git, GitHub

## 🔒 Segurança

Este projeto segue as melhores práticas de segurança para aplicações em nuvem:

- Credenciais armazenadas em arquivos separados fora do controle de versão
- Uso de variáveis de ambiente para dados sensíveis
- Configuração adequada do .gitignore para evitar vazamento de informações
- Separação clara entre código e configuração

## 🤝 Contribuindo

Para contribuir com este projeto:

1. Faça um fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Faça commit das suas alterações (`git commit -m 'Adiciona nova funcionalidade'`)
4. Envie para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## 📚 Recursos de Aprendizado

- [Documentação do Azure Container Apps](https://docs.microsoft.com/pt-br/azure/container-apps/)
- [Melhores práticas para Docker](https://docs.docker.com/develop/dev-best-practices/)
- [Padrões de Microsserviços](https://docs.microsoft.com/pt-br/azure/architecture/microservices/design/patterns)
- [DevOps no Azure](https://docs.microsoft.com/pt-br/azure/devops/learn/)
- [Práticas de Observabilidade](https://docs.microsoft.com/pt-br/azure/azure-monitor/overview)

## 📝 Habilidades Desenvolvidas

Ao trabalhar neste projeto, você desenvolverá:

1. **Fundamentos do Azure**: Recursos, grupos de recursos, regiões
2. **Containerização**: Docker, imagens, registros
3. **Azure Container Apps**: Ambientes, revisions, scaling
4. **DevOps**: Scripts de automação, CI/CD
5. **Frontend**: HTML5, JavaScript, Bootstrap
6. **Monitoramento**: Logs, métricas, alertas

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para detalhes.

## 👤 Autor

Gilson Silva - [GitHub](https://github.com/gisengsoft)

---

Desenvolvido como parte do estudo sobre Azure Container Apps e aplicações conteineirizadas na nuvem Microsoft Azure.
