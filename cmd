java -cp java_cup.jar java_cup.Main -parser MPParser MPParser.cup
javac MPParser.java

java MPParser primeri/0_nema_Main-a
java MPParser primeri/1_nest_level,read,repeat
java MPParser primeri/2_isti_naziv_promenljiva_razliciti_nivoi-semanticka_greska
java MPParser primeri/3_nedozvoljena_dodela-semanticka_greska
java MPParser primeri/4_repeat_until_semanticka_greska
java MPParser primeri/5_promentljiva_nije_deklarisana-semanticka_greska
java MPParser primeri/6_ugnjezdena_petlja
java MPParser primeri/7_petlja_bez_stetment-a
java MPParser primeri/8_blok_greska
java MPParser primeri/9_ponovno_deklarisanje-semanticka_greska
java MPParser primeri/10_aritm_oper_nad_bool-semanticka_greska
java MPParser primeri/11_relac_oper_bool_res_1-semanticka_greska
java MPParser primeri/12_relac_oper_bool_res_2
java MPParser primeri/13_logic_oper



