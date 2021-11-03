:-style_check(-singleton).
:-style_check(-discontiguous).
:-style_check(-no_effect).
:-style_check(-var_branches).
:-style_check(-charset).
must_be_punished(-1,-1).
section_list([]).
t.
guilty:-final([116,115,114,1081,108,1241,1211,130,129,128,127,126,125,124,123,122,121,120,119,118,117,113,112,111,110,103,102,100,98,97,96,95,93,90,89,88,85,84,83,82,79,78,77]),section_list(Z),check_not_guilty(Z),check_guilty(Z),((current_predicate(not_guilty/0),write('Not Guilty'),nl);(current_predicate(guilt/0),write('Guilty'),nl);write('')),section_list(Z),printt(Z).
printt([]):-write('').
printt([H|T]):-
    printt(T),write(H),write(', ').

check_not_guilty([]):- write(''),current_predicate(not_guilty/0),retract(not_guilty);write('').
check_not_guilty([H|T]):-
    check_guilty(T),H>106;not(current_predicate(not_guilty/0)),assert(not_guilty);t.

check_guilty([]):- write(''),current_predicate(guilt/0),retract(guilt);write('').
check_guilty([H|T]):-
    check_guilty(T),H>75,H<107;not(current_predicate(guilt/0)),assert(guilt);t.

assert1([]):-write('').
assert1([H|T]):-
    assert1(T),assert(H).

final_guilty(X):-assert1(X),guilty.
append_section_list(Y):-
    (section_list(Z),not(memb_section_list(Y)),append(Z,[Y],X),assert(section_list(X)),retract(section_list(Z)));t.

memb_section_list(X):-
    section_list(Z),memb(X,Z).

final([]):-write('').
final([H|T]):-
    final(T),ipc(H).
ipc(77):-current_predicate(bound_or_believebound/3),bound_or_believebound(P,R,Q),memb(P,['army_officer','police','court_judge','black_cop']),current_predicate(offence/1),offence(Q),append_section_list(76),append_section_list(77);t.

ipc(78):-current_predicate(order_of_court/1),order_of_court(Y),current_predicate(perform/2),perform(X,Y),append_section_list(78);t.
memb_ipccheck(X):-
    ipccheck(Z),memb(X,Z).

ipccheck(['stop_theft','murder','save_child']).

ipc(79):-current_predicate(thinks_lawful/2),thinks_lawful(X,Y),memb_ipccheck(Y),append_section_list(79);t.

minor(A) :-
    current_predicate(act_performed/2),act_performed(A,B),B < 7.

ipc(82):-minor(A),append_section_list(82);t.

ipc(83):-current_predicate(act_performed/2),act_performed(A,B),B>7,B<12,current_predicate(less_understanding/1),less_understanding(A),append_section_list(83);t.

ipc(84):-current_predicate(mad/1),mad(A),append_section_list(84);t.

ipc(85):-current_predicate(drugged/1),drugged(A),current_predicate(no_permission/1),no_permission(A),append_section_list(85);t.

ipc(88):- current_predicate(doing_good_action/2),doing_good_action(C,A),current_predicate(consent/1),consent(A),append_section_list(88);t.

elder(A,B):-parent(A,B).
elder(A,B):-parent(C,B),elder(A,C).

ipc(89):-((current_predicate(mad/1),mad(A));(current_predicate(parentpermission/3),parentpermission(C,A,B),current_predicate(parent/2),elder(B,A))),append_section_list(89);t.

ipc(90):-(current_predicate(child/2),child(A,B),B<12);current_predicate(mad/1),mad(A);current_predicate(under_fear/1),under_fear(A),assert(no_permission(A)),append_section_list(90);t.
ipc( 93) :-current_predicate(commution_goodobjective/2),commution_goodobjective(A,B),append_section_list(93);t.

ipc(95):- current_predicate(unobserved_hurt/2),unobserved_hurt(A,B),append_section_list(95);t.

ipc(96) :- current_predicate(own_security/3), own_security(A,B,C),current_predicate(memb/2), memb(B,['house','own_shop','body']),append_section_list(96);t.

ipc(97) :- current_predicate(own_security/3), own_security(A,B,C), current_predicate(memb/2), memb(B,['body','property']),append_section_list(97);t.

ipc(98) :- current_predicate(own_security/3),own_security(A,B,C) ,current_predicate(mad/1),mad(C),append_section_list(98);t.

ipc(100):-current_predicate(own_security/3),own_security(A,B,C),current_predicate(offence/1),offence(D),current_predicate(memb/2),memb(D,['kidnapping','death','rape_woman','assault','lust','acid_attack']),append_section_list(100);t.

ipc(102):-current_predicate(own_security/3),own_security(A,body,B),(current_predicate(tries_to_commit/3),tries_to_commit(B,A,any_offence)),((current_predicate(action/3),action(B,A,threat_offence))),append_section_list(124);t.

ipc(103):-current_predicate(own_security/3),own_security(A,B,C),current_predicate(offence/1),offence(D),memb(D,['group_attack','robbery','theft']),append_section_list(103),append_section_list(104),append_section_list(105);t.

does_abetting(A,B,C):-
    (current_predicate(instigation/3),instigation(A,B,C));  (current_predicate(part_of_plan/3),part_of_plan(A,B,C));  (current_predicate(purposely_help/3),purposely_help(A,B,C)),append_section_list(107).

is_abettor(A,B,C):-
    does_abetting(A,B,C), current_predicate(offence/1),offence(C).
ipc(110):-
    does_abetting(A,B,C),current_predicate(perform/2),perform(B,D),current_predicate(other_motive/2),other_motive(A,B),append_section_list(110);t.

ipc(111):-
    does_abetting(A,B,C),current_predicate(perform/2),perform(B,D),current_predicate(not_perform/2),not_perform(B,C),current_predicate(as_result_of/2),as_result_of(D,C),assert(does_abetting(A,B,D)),append_section_list(111);t.

ipc(112):-
    does_abetting(A,B,C),current_predicate(perform/2),perform(B,D),perform(B,C),current_predicate(as_result_of/2),as_result_of(C,D),assert(does_abetting(A,B,D)),append_section_list(112);t.

ipc(113):-
    does_abetting(A,B,C),current_predicate(as_result_of/2),as_result_of(C,D),current_predicate(perform/2),perform(B,D),current_predicate(aware_of_result/3),aware_of_result(A,C,D),current_predicate(unintentionally/3),unintentionally(A,B,D),assert(does_abetting(A,B,D)),append_section_list(113);t.

ipc(108):-
    is_abettor(A,B,C),append_section_list(108);t.

ipc(1081):
    is_abettor(A,B,C), current_predicate(outside/1),outside(C),append_section_list(109);t.


ipc(114):-
    is_abettor(A,B,C),current_predicate(present/1),present(A),append_section_list(114);t.

ipc(115):-
    is_abettor(A,B,C),current_predicate(hurting/1),hurting(C,Y),append_section_list(115);t.

ipc(116):-
    is_abettor(A,B,C),current_predicate(public_servant/1),public_servant(A),current_predicate(prevent_obligation/2),prevent_obligation(A,C),append_section_list(116);t.

length(A,Cnt):-
        findlength(A,Cnt).

findlength([],A):-
        A=0.

findlength([A|Tail],Cnt):-
        findlength(Tail,Prev),
        Cnt = Prev + 1.

ipc(117):-
     is_abettor(A,B,C),((length(B,Count),Count>10);(current_predicate(are_public_a/1),are_public_a(B))),append_section_list(117);t.

ipc(118):-
    current_predicate(hide/2),hide(A,C) , current_predicate(design_to_perform_offence/1),design_to_perform_offence(C),current_predicate(must_be_death_punishment/1),must_be_death_punishment(C),append_section_list(118);t.

ipc(119):-
    current_predicate(hide/2),hide(A,C) , current_predicate(design_to_perform_offence/1),design_to_perform_offence(C),current_predicate(public_servant/1),public_servant(A), current_predicate(prevent_obligation/2),prevent_obligation(A,C),append_section_list(119);t.

ipc(120):-
    current_predicate(hide/2),hide(A,C) , current_predicate(design_to_perform_offence/1),design_to_perform_offence(C),current_predicate(must_be_imprisonment_punishment/1),must_be_imprisonment_punishment(C),append_section_list(120);t.


ipc(121):- ((current_predicate(action/3) ,action(L,gov_of_ind,war));(current_predicate(tries_to_commit/3),tries_to_commit(L,gov_of_ind,war));(current_predicate(does_abetting/3),does_abetting(L,gov_of_ind,war))),append_section_list(121);t.


ipc(122):-  (((current_predicate(take/2),take(A,arms));(current_predicate(take/2),take(A,ammo));(current_predicate(take/2),take(A,men))) ,((current_predicate(objective/3),objective(A,gov_of_ind,war));prepare(A,gov_of_ind,war))) ,append_section_list(122);t.

ipc(123):-  ((current_predicate(hide_plan_war/2),hide_plan_war(A,gov_of_ind)) , ((current_predicate(startwar/2),startwar(A,gov_of_ind));(current_predicate(aware_of_hiding_war_det/2),aware_of_hiding_war_det(A,gov_of_ind)))),append_section_list(123);t.

ipc(125):- (((current_predicate(action/3),action(A,Country,war));(current_predicate(tries_to_commit/3),tries_to_commit(A,Country,war));(current_predicate(does_abetting/3),does_abetting(A,Country,war))),((current_predicate(alliance/2),alliance(Country,gov_of_ind));(current_predicate(with_harmony/2),with_harmony(Country,gov_of_ind)))),append_section_list(125);t.

ipc(126) :- (((current_predicate(perform_depredation/2),perform_depredation(A,Country));(current_predicate(try_to_depredate/2),try_to_depredate(A,Country))),((current_predicate(alliance/2),alliance(Country,gov_of_ind));(current_predicate(with_harmony/2),with_harmony(Country,gov_of_ind)))),append_section_list(126);t.

ipc(127) :- ((current_predicate(procure_instrument/1),procure_instrument(A)),(current_predicate(aware_of_war_depredate/2),aware_of_war_depredate(A,X)),(current_predicate(alliance/2),alliance(A,gov_of_ind))),append_section_list(127);t.


ipc(128) :- ((current_predicate(war_or_state_prisoner/1),war_or_state_prisoner(A)),(current_predicate(public_servant/1),public_servant(L)),(current_predicate(flee/3),flee(L,A,voluntarily))),append_section_list(128);t.


ipc(129):- ((current_predicate(war_or_state_prisoner/1),war_or_state_prisoner(A)),(current_predicate(public_servant/1),public_servant(L),(current_predicate(flee/3),flee(L,A,negligence)))),append_section_list(129);t.

ipc(130) :- (current_predicate(war_or_state_prisoner/1),(war_or_state_prisoner(A)), ((current_predicate(help_flee/2),help_flee(L,A)); (current_predicate(assists_flee/2),assists_flee(L,A));(current_predicate(protect/2),protect(L,A)); (current_predicate(aid_rescue/2),aid_rescue(L,A));(current_predicate(harbour/2),harbour(L,A));(current_predicate(conceal/2),conceal(L,A));(current_predicate(tries_to_commit/3),tries_to_commit(L,gov_of_ind,resistance));(current_predicate(action/3),action(L,gov_of_ind,resistance)))),append_section_list(130);t.

ipc(1211):-(((current_predicate(create_conspiracy/3),create_conspiracy(A,gov_of_ind,wage_war));(current_predicate(create_conspiracy/3),create_conspiracy(A,gov_of_ind,create_conspiracy_war));(current_predicate(create_conspiracy/3),create_conspiracy(A,gov_of_ind,abbet_war));(current_predicate(create_conspiracy/3),create_conspiracy(A,gov_of_ind,overawe))),((current_predicate(thing_used/3),thing_used(A,gov_of_ind,criminal_force));(current_predicate(thing_used/3),thing_used(A,gov_of_ind,show_criminal_force)))),append_section_list(1211);t.


ipc(1241):- ( ((current_predicate(tries_to_commit/3),tries_to_commit(A,gov_of_ind,cause_hatred));(current_predicate(tries_to_commit/3),tries_to_commit(A,gov_of_ind,contempt));(current_predicate(action/3),action(A,gov_of_ind,excite_dissatisfaction));(current_predicate(tries_to_commit/3),tries_to_commit(A,gov_of_ind,excite_dissatisfaction)))  ,  ( (current_predicate(thing_used/3),thing_used(A,gov_of_ind,words_written)); (current_predicate(thing_used/3),thing_used(A,gov_of_ind,words_spoken));(current_predicate(thing_used/3),thing_used(A,gov_of_ind,signs));(current_predicate(thing_used/3),thing_used(A,gov_of_ind,visible_representation)))),append_section_list(1241);t.

ipc(124):-(((current_predicate(objective/3),objective(A,Highrankofficialperson,inducing));(current_predicate(objective/3),objective(A,Highrankofficial,compelling))),((current_predicate(forces/3),forces(A,Highrankofficial,act_accodingly));(current_predicate(forces/3),forces(A,Highrankofficial,not_act_accordingly))),((current_predicate(tries_to_commit/3),tries_to_commit(A,Highrankofficial,overawes));(action(A,Highrankofficial,overawe));  (current_predicate(tries_to_commit/3),tries_to_commit(A,Highrankofficial,wrongfully_restrain));(current_predicate(action/3) ,action(A,Highrankofficial,wrongfully_restrain))   ;     (current_predicate(action/3) ,action(A,Highrankofficial,wrongfully_restrain))), ((current_predicate(thing_used/3),thing_used(A,Highrankofficial,criminal_force));(current_predicate(thing_used/3),thing_used(A,Highrankofficial,show_criminal_force)))),(current_predicate(official/1),official(Highrankofficial)),append_section_list(124);t.







