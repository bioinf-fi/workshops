[Odkaz na slidy](https://docs.google.com/presentation/d/1H05QRsodDosMxCv40tSm88UG10Z662RFWN0DjrlpABg/edit?usp=sharing) 

# Aktivita "Hledání mutací v reálných datech pomocí Galaxy"
Instrukce v [samostatném dokumentu](galaxy_task2.md)

# Aktivita "Detekce mutací <i>Plasmodia falciparum</i> pomocí bioinformatických nástrojů v příkazové řádce" - spuštění JupyterLab pracovního sešitu v Galaxy
## využití běžícího Jupyter Lab
1. Na webové stánce [Galaxy](https://usegalaxy.eu/) se přihlašte se do společného účtu `kratka` pomocí hesla `3.pB6!76FcD_vbY`
2. Na levé liště rozklikněte ikonu <b>Interactive tools</b> a otevřete jednu z pěti běžících úloh <b>JupyTool interactive tool</b>
3. Po otevření Jupyter Lab vytvořte složku s libovolným jménem a vytvořte do nej kopii pracovního sešitu `detekce_variant_v_plasmodiu.ipynb`
4. Otevřte pracovní sešit s dalšími instrukcemi ve své složce   


## spuštění vlastní úlohy Jupyter Lab
! Tuto část dělejte pouze na pokyne instruktora ! - nejspíš už nám běží úlohy, které můžete využít
1. Na levé liště [Galaxy](https://usegalaxy.eu/) klikněte na <b>Interactive tools</b> > <b>Interactive JupyterLab Notebook</b> > <b>Run Tool</b>. Na liště se zobrazí <b>JupyTool interactive tool Starting...</b>
2. Poté, co se stav změní na <b>Running</b>, otevřete Notebook levým kliknutím myši
3. V horním menu klikněte na <b>File</b> > <b>New</b> > <b>Terminal</b>
4. Do příkazové řádky zkopírujte příkaz pro stáhnutí pracovního sešitu
   
    `wget https://raw.githubusercontent.com/bioinf-fi/workshops/refs/heads/main/czech_hopes/detekce_variant_v_plasmodiu.ipynb`

   potvrďte zmáčknutím Enter
5. V levé liště (<b>File Browser</b>) se zobrazí soubor `detekce_variant_v_plasmodiu.ipynb` s dalším postupem
