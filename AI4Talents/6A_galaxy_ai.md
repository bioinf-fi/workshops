# Aktivita 6A: Nájdite mutácie s pomocou AI agenta

**Cieľ:** v reálnych dátach pacienta nájdite **aspoň jeden príklad skutočnej mutácie** a **aspoň jeden príklad chyby sekvenovania** – a vysvetlite, ako ste ich od seba rozoznali. Nemusíte nájsť všetko.

**Pravidlá:** tentoraz **bez návodu krok za krokom**. Pracujte s **AI v Galaxy** a všetko, čo vám povie, **overte v genómovom prehliadači**.


## Dáta

Reálne exómové dáta pacienta. Ready pochádzajú len z tohto úseku **chromozómu 8** (súradnice v **hg38**):

```
chr8:84087765-88987771
```

> ℹ️ **Exóm** = sekvenovali sa len exóny génov (časti, podľa ktorých sa tvoria proteíny). **Medzi génmi preto readov nevidíte – to je v poriadku.** Ready sa v prehliadači zobrazia až po priblížení (menej ako ~30 kb).


## Import dát

Importujte históriu s dátami:

**Histories** → **Public histories** → **ai4talents_6a** → **Import this history**

> priamy odkaz: [usegalaxy.cz/u/1b8ea9192727427c9be06de5b9a904cd/h/ai4talents-6a](https://usegalaxy.cz/u/1b8ea9192727427c9be06de5b9a904cd/h/ai4talents-6a)

V histórii nájdete `proband.fastq` – ready pacienta.

> ℹ️ Ready mapujte na celý ľudský genóm **hg38**, ktorý je v Galaxy vstavaný – rovnako ako v Aktivite 2.

## Ako začať s AI

Vyriešte úlohu s pomocou AI v Galaxy – **GalaxyAI** (interaktívny chat vľavo v menu) alebo **LLM Hub** (nástroj, ktorý pracuje so súbormi z histórie). Ako s nimi pracovať, nájdete v návode **[🤖 Ako pracovať s AI v Galaxy](ai_v_galaxy.md)**.

> ⚠️ **AI sa môže mýliť.** Ak niečo nefunguje alebo odpoveď nedáva zmysel, overte si to sami.

> ℹ️ **Pripomienka:** okrem ručného prezerania existuje aj program, ktorý porovná namapované ready s referenciou a mutácie vyhľadá za vás (napr. **FreeBayes** alebo **DeepVariant**).
> Takýto program voláme **variant caller**.
> Ale aj jeho výsledky však treba **správne nastaviť a skontrolovať** – nie každý nájdený variant je skutočná mutácia.


## Výsledok

Odpovedzte na otázky:

1. **Skutočná mutácia:** pozícia + zmena (napr. `chr8:85464053 A → G`) a prečo si myslíte, že je skutočná.
2. **Chyba sekvenovania:** pozícia + prečo to podľa vás mutácia nie je.
3. **Kde sa AI mýlila** alebo poradila zle (ak áno).


## Nápovedy

<details>
<summary>💡 Neviete, čo sa AI opýtať?</summary>

Napríklad:

- *„Mám single-end ready pacienta. Ako ich namapujem na ľudský genóm hg38?“* (GalaxyAI)
- *„Ako si zobrazím namapované ready v genómovom prehliadači?“* (GalaxyAI)
- *„Podľa čoho rozoznám skutočnú mutáciu od chyby sekvenátora?“* (GalaxyAI alebo LLM Hub)

</details>

<details>
<summary>💡 Ťahák: mutácia alebo chyba?</summary>

| | Skutočná mutácia | Chyba sekvenátora |
|---|---|---|
| **Koľko readov** | veľa readov na tej istej pozícii – ≈ 50 % (heterozygot) alebo ≈ 100 % (homozygot) | len pár readov |
| **Vlákna DNA** | na oboch vláknach | často len na jednom vlákne |
| **Kde v reade** | kdekoľvek | často na konci readu |
| **Kvalita** | vysoká kvalita bázy | nízka kvalita, opakovania (AAAAA…) |

</details>

<details>
<summary>💡 V ktorých úsekoch sú ready?</summary>

Ready nájdete v exónoch týchto génov. Skopírujte úsek do vyhľadávania v prehliadači a potom si priblížte jednotlivé exóny.

| Gén | Úsek | Exóny |
|-----|------|------:|
| RALYL | `chr8:84183274-84921844` | 9 |
| LRRCC1 | `chr8:85107238-85146080` | 19 |
| E2F5 | `chr8:85177154-85214518` | 8 |
| RBIS | `chr8:85214048-85220374` | 4 |
| CA13 | `chr8:85245458-85284073` | 7 |
| CA1 | `chr8:85327608-85378113` | 8 |
| CA3 | `chr8:85438859-85449040` | 7 |
| CA2 | `chr8:85464007-85481493` | 7 |
| REXO1L1P | `chr8:85661524-85663497` | 1 |
| REXO1L2P | `chr8:85775106-85779090` | 2 |
| PSKH2 | `chr8:86047109-86069668` | 3 |
| ATP6V0D2 | `chr8:86098910-86154225` | 8 |
| SLC7A13 | `chr8:86214063-86230381` | 4 |
| WWP1 | `chr8:86342547-86468503` | 25 |
| RMDN1 | `chr8:86472349-86508686` | 10 |
| CPNE3 | `chr8:86514435-86561498` | 17 |
| CNGB3 | `chr8:86574179-86743634` | 18 |
| CNBD1 | `chr8:86866415-87382859` | 11 |
| DCAF4L2 | `chr8:87870747-87874015` | 1 |
| MMP16 | `chr8:88032011-88327483` | 10 |

Neviete, kde začať? Skúste prvý exón génu **CA2**: `chr8:85463800-85464500`

</details>

---

[← späť na prehľad aktivít](README.md)
