---
description: Atualiza upstream-main e gat-main a partir do repositório oficial da Unimake
---

Siga exatamente o fluxo abaixo, documentado no `CLAUDE.md` na raiz do repositório.

## 1. Buscar atualizações

```
git fetch oficial
```

Liste os commits novos em `oficial/main` que ainda não estão em `upstream-main` (`git log --oneline upstream-main..oficial/main`) e resuma pro usuário quantos são e os principais temas (schemas, correções, novos serviços etc), antes de continuar.

## 2. Atualizar `upstream-main` (deve ser sempre fast-forward)

```
git checkout upstream-main
git merge --ff-only oficial/main
```

Se o fast-forward falhar, PARE e avise o usuário — algo alterou essa branch fora do fluxo esperado, não force nada.

Se der certo, faça `git push origin upstream-main`.

## 3. Mesclar `oficial/main` em `gat-main`

```
git checkout gat-main
git merge oficial/main
```

### Se não houver conflito

Compile para confirmar que nada quebrou:

```
dotnet build "source/.NET Standard/Unimake.Business.DFe/Unimake.Business.DFe.csproj"
```

Se compilar OK, confirme com o usuário antes de dar `git push origin gat-main` (push é uma ação visível/compartilhada — sempre peça confirmação antes).

### Se houver conflito

1. Nos arquivos em conflito, localize no lado `HEAD`/`ours` os trechos marcados `//GAT TECNOLOGIA` (veja a lista em `CLAUDE.md` na seção "Convenção das customizações GAT TECNOLOGIA" para saber quais arquivos/métodos costumam ter customização).
2. Entenda o que a Unimake mudou no lado deles (renomeou método, moveu lógica, mudou assinatura etc).
3. Aceite a estrutura nova da Unimake e reaplique a mesma lógica de negócio da GAT sobre ela, mantendo o comentário `//GAT TECNOLOGIA` com uma explicação do motivo.
4. Compile antes de finalizar:
   ```
   dotnet build "source/.NET Standard/Unimake.Business.DFe/Unimake.Business.DFe.csproj"
   ```
5. `git add` nos arquivos resolvidos, `git commit` (sem `--no-verify`).
6. Atualize a lista de customizações no `CLAUDE.md` se algum arquivo/método novo passou a ter customização, ou se a lógica de uma customização existente mudou.
7. Peça confirmação ao usuário antes de `git push origin gat-main`.

## Observações

- Nunca use `--no-verify`, `--force` ou operações destrutivas nesse fluxo.
- Sempre confirme com o usuário antes de dar push (tanto de `upstream-main` quanto de `gat-main`), a menos que ele já tenha autorizado explicitamente no pedido.
- Ao final, resuma o que foi atualizado: quantos commits, o que mudou de relevante, se houve conflito e como foi resolvido, e se o push foi feito.
