# CLAUDE.md

## Sobre este repositório

Este é um fork do repositório oficial da Unimake (`Unimake/DFe`), usado para emitir/consultar/validar documentos fiscais eletrônicos (NFe, NFCe, CTe, MDFe, NFSe, NF3e, DCe, etc). Sobre o código original são aplicadas customizações de negócio da **GAT TECNOLOGIA**, diretamente nos arquivos da biblioteca `Unimake.Business.DFe`.

Ver `AGENTS.md` para convenções de arquitetura e estilo de código do projeto em si. Este arquivo documenta o **fluxo de fork/branches** e **onde estão as customizações da GAT**.

## Remotes configurados

- `oficial` → `https://github.com/Unimake/DFe.git` (repositório original da Unimake, upstream)
- `origin` → `https://github.com/RenatoTrindade/DFe.git` (fork da GAT)

## Branches

- **`gat-main`** — branch padrão do fork e branch de trabalho. Tem todo o histórico do `oficial/main` mais as customizações da GAT. É a branch usada pelo projeto/produto local (checkout local aponta pra ela). Todo desenvolvimento e atualização a partir do upstream acontece aqui.
- **`upstream-main`** — espelho puro de `oficial/main`. Nunca recebe commit direto nem customização. Serve só como referência/base limpa pra comparar e mesclar.
- **`main`** — branch legada, anterior à separação em `upstream-main`/`gat-main`. Descontinuada: o branch padrão do fork foi trocado para `gat-main` e a `main` foi removida (local e remota). Não usar para novo trabalho; se aparecer alguma referência antiga a ela, trocar para `gat-main`.

## Convenção das customizações GAT TECNOLOGIA

Toda alteração de comportamento feita pela GAT sobre o código original da Unimake deve ser marcada com o comentário `//GAT TECNOLOGIA`, explicando o motivo da mudança. Isso é o que permite localizar rapidamente o que precisa ser reaplicado quando a Unimake reescreve o mesmo trecho em uma atualização futura.

Locais atuais com customização (atualizar esta lista sempre que uma nova for adicionada):

- `source/.NET Standard/Unimake.Business.DFe/Servicos/NFCe/Autorizacao.cs` — recarrega o objeto `EnviNFe` a partir do XML já assinado, antes de montar o QRCode.
- `source/.NET Standard/Unimake.Business.DFe/Utility/QrCodeXmlHelper.cs`, método `MontarQrCodeNFCe` — preserva o `qrCode`/`urlChave` que já existirem no XML de entrada; sempre recria o grupo `infNFeSupl` (removendo o existente antes, em vez de pular quando já presente); usa a `urlChave`/`urlQrCode` originais extraídas do XML quando informadas, em vez de recalcular sempre a partir de `Configuracao`.

## Como manter as branches atualizadas com o upstream

### Atualizar `upstream-main` (deve ser sempre fast-forward, sem conflito)

```
git fetch oficial
git checkout upstream-main
git merge --ff-only oficial/main
git push origin upstream-main
```

Se o fast-forward falhar, algo alterou essa branch fora do fluxo esperado — investigar antes de continuar, não forçar.

### Atualizar `gat-main` (aqui é onde aparecem os conflitos com as customizações)

```
git fetch oficial
git checkout gat-main
git merge oficial/main
```

Se houver conflito:

1. Localizar, no lado `HEAD`/`ours`, os trechos marcados `//GAT TECNOLOGIA` no(s) arquivo(s) em conflito.
2. Entender o que a Unimake mudou no lado deles (renomeou método, moveu lógica, mudou assinatura etc).
3. Aceitar a estrutura nova da Unimake e reaplicar a mesma lógica de negócio da GAT sobre ela, mantendo o comentário `//GAT TECNOLOGIA`.
4. Compilar antes de finalizar o merge:
   ```
   dotnet build "source/.NET Standard/Unimake.Business.DFe/Unimake.Business.DFe.csproj"
   ```
5. `git add` nos arquivos resolvidos, `git commit` (sem `--no-verify`), depois `git push origin gat-main`.

## Build de referência

```
dotnet build "source/.NET Standard/Unimake.Business.DFe/Unimake.Business.DFe.csproj" -c Debug
```
