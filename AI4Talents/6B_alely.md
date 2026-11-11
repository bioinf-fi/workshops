# Aktivita 6B: Alely naprieč kontinentmi

**Cieľ:** zistite, ako často sa vybraný variant (alela) vyskytuje na rôznych kontinentoch.

**Pravidlá:** pracujte s **AI v Galaxy** – **GalaxyAI** (interaktívny chat vľavo v menu) alebo **LLM Hub** (nástroj, ktorý pracuje so súbormi z histórie), ako vám to vyhovuje. Návod nájdete v **[🤖 Ako pracovať s AI v Galaxy](ai_v_galaxy.md)**. Odpovede AI **overte na dátach**.


## Varianty

Vyberte si variant, ktorý vás zaujíma – alebo si pozrite viac z nich:

| Variant | Gén | Čo ovplyvňuje |
|---|---|---|
| `rs334` | HBB | kosáčikovitá anémia (mutácia z Aktivity 2) |
| `rs4988235` | LCT | trávenie mlieka v dospelosti |
| `rs1426654` | SLC24A5 | farba pokožky |
| `rs671` | ALDH2 | začervenanie po alkohole |
| `rs713598` | TAS2R38 | vnímanie horkej chuti |


## Dáta

Skutočné genotypy **2 504 ľudí** z projektu **1000 Genomes** z celého sveta. Pre každého človeka viete, akú má verziu (alelu) každého variantu a z ktorej populácie pochádza. Koľko percent ľudí na kontinente má danú alelu, si **spočítate sami** – s pomocou AI.

| Skratka | Populácia |
|---|---|
| AFR | Afrika |
| EUR | Európa |
| EAS | východná Ázia |
| SAS | južná Ázia |
| AMR | Amerika |


## Import dát

Importujte históriu s dátami:

**Histories** → **Public histories** → **ai4talents-6b** → **Import this history**

> priamy odkaz: [usegalaxy.cz/u/1b8ea9192727427c9be06de5b9a904cd/h/ai4talents-6b](https://usegalaxy.cz/u/1b8ea9192727427c9be06de5b9a904cd/h/ai4talents-6b)

V histórii nájdete:
- `6B_genotypy.tsv` – genotypy: vzorka (človek), variant, gén, genotyp (napr. `T|A` – jedna kópia od mamy, jedna od otca), sledovaná alela a koľko jej kópií človek má (0, 1 alebo 2)
- `6B_vzorky.tsv` – odkiaľ je ktorá vzorka: populácia a kontinent (superpopulácia AFR, EUR, …)


## Úloha

1. **Spýtajte sa AI na svoj variant** – čo robí a aká častá je jeho alela v Afrike, Európe, Ázii a Amerike. Odpoveď si zapíšte.
2. **Spočítajte to z dát** – s pomocou AI spojte obe tabuľky a vypočítajte frekvenciu alely na každom kontinente (a ak chcete, nakreslite si graf).
3. **Porovnajte** – mala AI pravdu?


## Výsledok

Odpovedzte na otázky:

1. Na ktorom kontinente je alela **najčastejšia** a kde takmer chýba?
2. **Prečo** si myslíte, že sa frekvencie medzi kontinentmi líšia?
3. V čom sa AI **mýlila** alebo si čísla vymyslela (ak áno)?


## Nápovedy

<details>
<summary>💡 Neviete, čo sa AI opýtať?</summary>

Napríklad:

- *„Čo robí variant rs334 v géne HBB?“* (GalaxyAI alebo LLM Hub)
- *„Aká je frekvencia alely rs334 v Afrike, Európe a Ázii?“* (GalaxyAI alebo LLM Hub)
- *„Ako v Galaxy spojím dve tabuľky podľa stĺpca vzorka?“* (GalaxyAI)
- *„Ako vyfiltrujem len riadky pre variant rs334?“* (GalaxyAI)
- *„Ako spočítam priemer stĺpca pocet_kopii_alely pre každý kontinent?“* (GalaxyAI; frekvencia alely = priemer ÷ 2)
- *„Ako z tabuľky v Galaxy nakreslím stĺpcový graf?“* (GalaxyAI)
- vaša spočítaná tabuľka + *„Prečo sa tieto frekvencie medzi kontinentmi líšia?“* (LLM Hub)

</details>

<details>
<summary>💡 Kde ešte nájdem frekvencie?</summary>

V prehliadači **Ensembl** – na stránke variantu v záložke *Population genetics*, napríklad:

[ensembl.org/Homo_sapiens/Variation/Population?v=rs334](https://www.ensembl.org/Homo_sapiens/Variation/Population?v=rs334)

(stačí na konci zmeniť `rs334` na svoj variant)

</details>


---

[← späť na prehľad aktivít](README.md)
