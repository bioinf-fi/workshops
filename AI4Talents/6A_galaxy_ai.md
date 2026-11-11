# Aktivita 6A: Nájdite mutácie s pomocou AI agenta

**Cieľ:** v reálnych dátach pacienta nájdite **aspoň jeden príklad skutočnej mutácie** a **aspoň jeden príklad chyby sekvenovania** – a vysvetlite, ako ste ich od seba rozoznali. Nemusíte nájsť všetko.

**Pravidlá:** tentoraz **bez návodu krok za krokom**. Pracujte s **AI v Galaxy** a všetko, čo vám povie, **overte v genómovom prehliadači**.


## Dáta

Reálne exómové dáta pacienta (referenčný genóm **hg19**). Ready pochádzajú len z tohto úseku **chromozómu 8**:

```
chr8:85000000-90000000
```

> ℹ️ **Exóm** = sekvenovali sa len exóny génov (časti, podľa ktorých sa tvoria proteíny). **Medzi génmi preto readov nevidíte – to je v poriadku.** Ready sa v prehliadači zobrazia až po priblížení (menej ako ~30 kb).


## Import dát

Importujte históriu s dátami:

**Histories** → **Public histories** → **ai4talents_6a** → **Import this history**

> priamy odkaz: [usegalaxy.cz/u/1b8ea9192727427c9be06de5b9a904cd/h/ai4talents_6a](https://usegalaxy.cz/u/1b8ea9192727427c9be06de5b9a904cd/h/ai4talents_6a)

V histórii nájdete:
- `proband.fastq` – ready pacienta
- `hg19_chr8.fa` – referenčná sekvencia chromozómu 8

> ⚠️ Dáta sú k verzii genómu **hg19** – **nie hg38** ako v Aktivite 2. Povedzte to aj AI, inak nebudú sedieť súradnice.

## Ako začať s AI

Vyriešte úlohu s pomocou AI v Galaxy – **GalaxyAI** (interaktívny chat vľavo v menu) alebo **LLM Hub** (nástroj, ktorý pracuje so súbormi z histórie). Ako s nimi pracovať, nájdete v návode **[🤖 Ako pracovať s AI v Galaxy](ai_v_galaxy.md)**.

> ⚠️ **AI sa môže mýliť.** Ak niečo nefunguje alebo odpoveď nedáva zmysel, overte si to sami.

> ℹ️ **Pripomienka:** okrem ručného prezerania existuje aj program, ktorý porovná namapované ready s referenciou a mutácie vyhľadá za vás (napr. **FreeBayes** alebo **DeepVariant**).
> Takýto program voláme **variant caller**.
> Ale aj jeho výsledky však treba **správne nastaviť a skontrolovať** – nie každý nájdený variant je skutočná mutácia.


## Výsledok

Odpovedzte na otázky:

1. **Skutočná mutácia:** pozícia + zmena (napr. `chr8:86376123 A → G`) a prečo si myslíte, že je skutočná.
2. **Chyba sekvenovania:** pozícia + prečo to podľa vás mutácia nie je.
3. **Kde sa AI mýlila** alebo poradila zle (ak áno).


## Nápovedy

<details>
<summary>💡 Neviete, čo sa AI opýtať?</summary>

Napríklad:

- *„Mám single-end ready pacienta a referenčnú sekvenciu chromozómu 8 (hg19). Ako ich namapujem?“* (GalaxyAI)
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
| RALYL | `chr8:85095252-85834271` | 9 |
| LRRCC1 | `chr8:86019176-86058512` | 19 |
| E2F5 | `chr8:86114181-86126487` | 7 |
| C8orf59 | `chr8:86126551-86132843` | 5 |
| CA13 | `chr8:86157515-86196502` | 7 |
| CA1 | `chr8:86240257-86264213` | 10 |
| CA3 | `chr8:86350855-86361465` | 7 |
| CA2 | `chr8:86375930-86393921` | 7 |
| REXO1L2P | `chr8:86566627-86728350` | 2 |
| REXO1L1 | `chr8:86568363-86787444` | 2 |
| PSKH2 | `chr8:87060492-87082051` | 3 |
| ATP6V0D2 | `chr8:87110938-87166654` | 8 |
| SLC7A13 | `chr8:87226087-87242804` | 4 |
| WWP1 | `chr8:87354793-87480376` | 24 |
| FAM82B | `chr8:87484378-87521209` | 10 |
| CPNE3 | `chr8:87526455-87573926` | 16 |
| CNGB3 | `chr8:87585961-87756101` | 18 |
| CNBD1 | `chr8:87878475-88366214` | 10 |
| DCAF4L2 | `chr8:88882772-88886496` | 1 |
| MMP16 | `chr8:89049261-89339917` | 10 |

Neviete, kde začať? Skúste prvý exón génu **CA2**: `chr8:86375900-86376600`

</details>

---

[← späť na prehľad aktivít](README.md)
