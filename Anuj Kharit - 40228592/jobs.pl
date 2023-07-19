name(employee,anuj_kharit).
sin(employee,956-859-456).
works_in(anuj_kharit,tata_consultancy_services).

name(employee, yash_jain).
sin(employee,458-856-256).
works_in(yash_jain,wipro).

name(employee,joyal_shah).
sin(employee,256-663-784).
works_in(joyal_shah,tata_consultancy_services).

name(employee,akshay_kumar).
sin(employee,741-523-665).
works_in(akshay_kumar,wipro).


name(employee,sanjay_dutt).
sin(employee,789-412-123).
works_in(sanjay_dutt,tata_consultancy_services).

name(employee,yashpal_chauhan).
sin(employee,235-647-432).
works_in(yashpal_chauhan,wipro).

name(employee,dixit_jain).
sin(employee,234-568-743).
works_in(dixit_jain,tata_consultancy_services).

name(employee,rahul_kumar).
sin(employee,552-789-115).
works_in(rahul_kumar,tata_consultancy_services).

name(employee,himalay_patel).
sin(employee,778-969-556).
works_in(himalay_patel,wipro).

name(employee,hardik_mochi).
sin(employee,149-854-627).
works_in(hardik_mochi,tata_consultancy_services).

name(employee,sumit_ghosh).
sin(employee,732-348-999).
works_in(sumit_ghosh,wipro).

name(employee,rakesh_thakar).
sin(employee,225-365-987).
works_in(rakesh_thakar,tata_consultancy_services).


name(employee,bhargav_suthar).
sin(employee,784-476-729).
works_in(bhargav_suthar,tata_consultancy_services).

name(employee,nirav_modi).
sin(employee,387-276-110).
works_in(nirav_modi,tata_consultancy_services).

name(employee,maulik_patel).
sin(employee,821-957-382).
works_in(maulik_patel,wipro).

name(employee,yatin_ladani).
sin(employee,836-854-366).
works_in(yatin_ladani,tata_consultancy_services).

name(employee,maulesh_soni).
sin(employee,847-554-191).
works_in(maulesh_soni,tata_consultancy_services).

name(employee,hitesh_purohit).
sin(employee,405-483-697).
works_in(hitesh_purohit,tata_consultancy_services).

name(employee,kanaiyalal_trivedi).
sin(employee,846-992-173).
works_in(kanaiyalal_trivedi,wipro).

name(employee,shivani_vakil).
sin(employee,147-279-484).
works_in(shivani_vakil,wipro).

name(employee,rohit_yagnik).
sin(employee,382-691-171).
works_in(rohit_yagnik,tata_consultancy_services).

name(employee,vishva_gandhi).
sin(employee,727-172-983).
works_in(vishva_gandhi,tata_consultancy_services).

name(employee,suresh_rana).
sin(employee,821-281-281).
works_in(suresh_rana,tata_consultancy_services).

name(employee,anushka_vala).
sin(employee,827-288-111).
works_in(anushka_vala,wipro).

name(employee,dev_rabari).
sin(employee,215-365-987).
works_in(dev_rabari,tata_consultancy_services).

name(employee,raam_oza).
sin(employee,123-464-749).
works_in(raam_oza,wipro).

name(employee,prakash_dhoni).
sin(employee,563-798-451).
works_in(prakash_dhoni,tata_consultancy_services).

name(employee,akshat_mehta).
sin(employee,676-232-885).
works_in(akshat_mehta,tata_consultancy_services).

name(employee,virat_kohli).
sin(employee,837-878-242).
works_in(virat_kohli,wipro).

name(employee,rohit_sharma).
sin(employee,343-672-241).
works_in(rohit_sharma,tata_consultancy_services).

name(employee,jasprit_bumrah).
sin(employee,765-984-771).
works_in(jasprit_bumrah,tata_consultancy_services).

name(employee,hardik_pandya).
sin(employee,161-282-281).
works_in(hardik_pandya,wipro).

name(employee,katrina_kaif).
sin(employee,987-987-780).
works_in(katrina_kaif,tata_consultancy_services).

name(employee,yash_vaghela).
sin(employee,091-281-011).
works_in(yash_vaghela,tata_consultancy_services).

name(employee,saurav_shukla).
sin(employee,401-014-282).
works_in(saurav_shukla,tata_consultancy_services).

name(employee,parthiv_tivari).
sin(employee,785-819-999).
works_in(parthiv_tivari,wipro).

name(employee,krunal_jani).
sin(employee,843-321-454).
works_in(krunal_jani,tata_consultancy_services).

name(employee,chintan_raval).
sin(employee,875-675-100).
works_in(chintan_raval,tata_consultancy_services).

name(employee,dhara_desai).
sin(employee,556-118-291).
works_in(dhara_desai,wipro).

name(employee,tilak_varma).
sin(employee,877-888-876).
works_in(tilak_varma,tata_consultancy_services).

name(employee,faf_duplesis).
sin(employee,383-873-341).
works_in(faf_duplesis,tata_consultancy_services).

name(employee,abhishek_ramanandi).
sin(employee,656-676-453).
works_in(abhishek_ramanandi,wipro).

employee_name_with_given_company_name(X):-works_in(X,tata_consultancy_services).

name_is(freelancer, jay_shah).
works_in(jay_shah,tata_consultancy_services).
specialization_is(jay_shah, data_scientist).
payrate_freelancer(jay_shah,23.5).

name_is(freelancer, raj_jain).
works_in(raj_jain,tata_consultancy_services).
specialization_is(raj_jain,web_designer).
payrate_freelancer(raj_jain,18.9).

name_is(freelancer,sohil_chauhan).
works_in(sohil_chauhan,wipro).
specialization_is(sohil_chauhan,java_developer).
payrate_freelancer(sohil_chauhan,25.20).

name_is(freelancer,rajesh_shah).
works_in(rajesh_shah,wipro).
specialization_is(rajesh_shah,front_end_developer).
payrate_freelancer(rajesh,28.20).


name_is(freelancer,rohan_jain).
works_in(rohan_jain,wipro).
specialization_is(rohan_jain,data_scientist).
payrate_freelancer(rohan_jain,19.63).

name_is(freelancer,banu_shah).
works_in(banu_shah,wipro).
specialization_is(banu_shah,web_developer).
payrate_freelancer(banu_shah,16.70).


name_is(freelancer,kangna_ranaut).
works_in(kangna_ranaut,wipro).
specialization_is(kangna_ranaut,python_developer).
payrate_freelancer(kangna_ranaut,20.29).

name_is(freelancer,kartik_aryan).
works_in(kartik_aryan,tata_consultancy_services).
specialization_is(kartik_aryan,full_stack_developer).
payrate_freelancer(kartik_aryan,29.60).

name_is(freelancer,harsh_yadav).
works_in(harsh_yadav,wipro).
specialization_is(harsh_yadav,senior_developer).
payrate_freelancer(harsh_yadav,25.20).

name_is(freelancer,suraj_singh).
works_in(suraj_singh,wipro).
specialization_is(suraj_singh,front_end_developer).
payrate_freelancer(suraj_singh,28.20).

name_is(freelancer,siddharth_malhotra).
works_in(siddharth_malhotra,wipro).
specialization_is(siddharth_malhotra,full_stack_developer).
payrate_freelancer(siddharth_malhotra,35.50).

name_is(freelancer,varun_dhavan).
works_in(varun_dhavan,tata_consultancy_services).
specialization_is(varun_dhavan,data_scientist).
payrate_freelancer(varun_dhavan,21.5).

name_is(freelancer,alka_suri).
works_in(alka_suri,wipro).
specialization_is(alka_suri,react_developer).
payrate_freelancer(alka_suri,17.85).

name_is(freelancer,dev_soni).
works_in(dev_soni,wipro).
specialization_is(dev_soni,php_develoer).
payrate_freelancer(dev_soni,33.21).

name_is(freelancer,saurav_ganguli).
works_in(saurav_ganguli,tata_consultancy_services).
specialization_is(saurav_ganguli,ios_developer).
payrate_freelancer(saurav_ganguli,34.41).

name_is(freelancer,sachin_tendulkar).
works_in(sachin_tendulkar,wipro).
specialization_is(sachin_tendulkar,android_developer).
payrate_freelancer(sachin_tendulkar,19.75).

name_is(freelancer,aamir_khan).
works_in(aamir_khan,wipro).
specialization_is(aamir_khan,data_scientist).
payrate_freelancer(aamir_khan,33.10).

name_is(freelancer,samarth_mendpara).
works_in(samarth_mendpara,tata_consultancy_services).
specialization_is(samarth_mendpara,data_scientist).
payrate_freelancer(samarth_mendpara,29.70).

name_is(freelancer,meet_kantesariya).
works_in(meet_kantesariya,wipro).
specialization_is(meet_kantesariya,etl_tester).
payrate_freelancer(meet_kantesariya,23.5).

name_is(freelancer,maulesh_kanani).
works_in(maulesh_kanani,tata_consultancy_services).
specialization_is(maulesh_kanani,quality_assurance).
payrate_freelancer(maulesh_kanani,38.77).

name_is(freelancer,kl_rahul).
works_in(kl_rahul,wipro).
specialization_is(kl_rahul,sql_head).
payrate_freelancer(kl_rahul,21.30).

name_is(freelancer,aashka_afridi).
works_in(aashka_afridi,wipro).
specialization_is(aashka_afridi,registration_desk).
payrate_freelancer(aashka_afridi,23.5).

name_is(freelancer,rajeshwari_desai).
works_in(rajeshwari_desai,wipro).
specialization_is(rajeshwari_desai,javascript_expert).
payrate_freelancer(rajeshwari_desai,32.55).

name_is(freelancer,nisha_vyas).
works_in(nisha_vyas,wipro).
specialization_is(nisha_vyas,social_media).
payrate_freelancer(nisha_vyas,18.60).

name_is(freelancer,pankaj_pujari).
works_in(pankaj_pujari,wipro).
specialization_is(pankaj_pujari,quality_assurance).
payrate_freelancer(pankaj_pujari,21.4).

name_is(freelancer,madam_kama).
works_in(madam_kama,tata_consultancy_services).
specialization_is(madam_kama,web_developer).
payrate_freelancer(madam_kama,36.45).

name_is(freelancer,punam_vyas).
works_in(punam_vyas,wipro).
specialization_is(punam_vyas,database_engineer).
payrate_freelancer(punam_vyas,22.5).

name_is(freelancer,krishna_yadav).
works_in(krishna_yadav,tata_consultancy_services).
specialization_is(krishna_yadav,software_developer).
payrate_freelancer(krishna_yadav,15.43).

name_is(freelancer,shardul_thakur).
works_in(shardul_thakur,wipro).
specialization_is(shardul_thakur,software_developer_trainee).
payrate_freelancer(shardul_thakur,32.9).

name_is(freelancer,dev_dutt).
works_in(dev_dutt,tata_consultancy_services).
specialization_is(dev_dutt,nodejs_developer).
payrate_freelancer(dev_dutt,23.5).

name_is(freelancer,rutvik_chudasama).
works_in(rutvik_chudasama,tata_consultancy_services).
specialization_is(rutvik_chudasama,blockchain_developer).
payrate_freelancer(rutvik_chudasama,14.25).

name_is(freelancer,khushal_panchal).
works_in(khushal_panchal,wipro).
specialization_is(khushal_panchal,ai_expert).
payrate_freelancer(khushal_panchal,23.5).

name_is(freelancer,john_wick).
works_in(john_wick,wipro).
specialization_is(john_wick,software_developer_intern).
payrate_freelancer(john_wick,26.10).

name_is(freelancer,scarlet_johnson).
works_in(scarlet_johnson,wipro).
specialization_is(scarlet_johnson,software_testing).
payrate_freelancer(scarlet_johnson,36.22).

name_is(freelancer,chetna_benarji).
works_in(chetna_benarji,tata_consultancy_services).
specialization_is(chetna_benarji,web_developer).
payrate_freelancer(chetna_benarji,23.5).

name_is(freelancer,mahekraj_dave).
works_in(mahekraj_dave,wipro).
specialization_is(mahekraj_dave,android_developer).
payrate_freelancer(mahekraj_dave,17.25).


name_is(company,tata_consultancy_services).
location(company, remote).
name_is(company,wipro).
location(is,montreal).


freelancer_employee_name_with_specialization(X,Z):-name_is(freelancer,X),works_in(X,wipro),specialization_is(X,Z).


freelancer_payrate_higher_than_given_amount(X) :-  name_is(freelancer,X),payrate_freelancer(X,Y),Y>=15.

manager(rohan_soni,wipro).
manager_payrate(rohan_soni,23.15).


manager(mahesh_nagar,tata_consultancy_services).
manager_payrate(mahesh_nagar,21.70).

manager_name_and_salary_for_given_company_name(X,Y):-manager(X,wipro),manager_payrate(X,Y).



