# Dados do Google Drive

Este diretório contém um script que baixa o arquivo do Google Drive referenciado no PR/issue.

Arquivo original:
- ID: 1k3DqcnqyorkvX7prsCahx2s58WlZupr3
- Link: https://drive.google.com/file/d/1k3DqcnqyorkvX7prsCahx2s58WlZupr3/view?usp=drive_link

Como usar
1) Execute o script localmente para baixar o arquivo para data/dados_drive.zip:

   chmod +x scripts/download_drive_file.sh
   ./scripts/download_drive_file.sh

2) Se o arquivo for público o download ocorrerá sem autenticação. Se for privado, conceda acesso ao Google account usada localmente ou faça o download manual e coloque o arquivo em data/.

Observações sobre tamanho e GitHub:
- Se o arquivo for maior que 100 MB, o GitHub não aceita o arquivo em um commit normal. Neste caso:
  - Use Git LFS (https://git-lfs.github.com/) e configure `git lfs track "data/dados_drive.zip"` antes de commitar localmente, ou
  - Armazene o arquivo em um Release/Storage externo e mantenha apenas o link no repositório.

O presente commit adiciona apenas o script e este README. Se você quiser que eu faça o download diretamente e inclua o arquivo no branch (ou configure Git LFS automaticamente), envie o arquivo aqui ou confirme que o arquivo é público e informe o tamanho aproximado.