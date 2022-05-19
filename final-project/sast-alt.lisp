(clear-all)

(define-model sast

;; Alterable Variables
;; utility threshold is manipulated to represent attempts by individuals to 
;;		compensate for the deleterious effects of fatigue
;; base-level activation is decremented to represent the slow down that happens 
;;		when fatigue increases
;; :rt	represent attempts by individuals to compensate for the deleterious
;;		effects of fatigue on attentional vigilance.
;; To represent decreased arousal within DM, Activation is decremented.
;; Along with lowering activation, they increased rt as a consequence of fatigue.
(sgp	:v t 
		:show-focus t
		:ans 0.4
		:mp 20.0
		:rt -60		;; This increases with fatigue
		:ms 0
		:md -1.0	
		:ut -1		;; This is increased with fatigue
		:esc t
)

;; 3 places retrieval can go wrong: encoding from screen, retrieving facts from memory
;; and retrieving the representation of the response digit. 

;; This chunk will be used to translate the visual representation to the slot representation. 
(chunk-type number visual-rep numerical-rep)
;; This chunk will be used to represent addition-facts
(chunk-type addition-fact add1 add2 tens ones)
;; This chunk will be used to represent subtraction-facts
(chunk-type subtraction-fact sub1 sub2 tens ones)
;; This chunk will be used to represent the problem in the imaginal buffer
(chunk-type problem num1 num2 ans)
;; This chunk will be used to represent the goal as a way of controlling flow
(chunk-type goal state)

(add-dm
(zero ISA number visual-rep "0" numerical-rep 0)
(one ISA number visual-rep "1" numerical-rep 1)
(two ISA number visual-rep "2" numerical-rep 2)
(three ISA number visual-rep "3" numerical-rep 3)
(four ISA number visual-rep "4" numerical-rep 4)
(five ISA number visual-rep "5" numerical-rep 5)
(six ISA number visual-rep "6" numerical-rep 6)
(seven ISA number visual-rep "7" numerical-rep 7)
(eight ISA number visual-rep "8" numerical-rep 8)
(nine ISA number visual-rep "9" numerical-rep 9)
(a0 isa addition-fact add1 zero add2 zero tens 0 ones 0)
(a1 isa addition-fact add1 zero add2 one tens 0 ones 1)
(a2 isa addition-fact add1 zero add2 two tens 0 ones 2)
(a3 isa addition-fact add1 zero add2 three tens 0 ones 3)
(a4 isa addition-fact add1 zero add2 four tens 0 ones 4)
(a5 isa addition-fact add1 zero add2 five tens 0 ones 5)
(a6 isa addition-fact add1 zero add2 six tens 0 ones 6)
(a7 isa addition-fact add1 zero add2 seven tens 0 ones 7)
(a8 isa addition-fact add1 zero add2 eight tens 0 ones 8)
(a9 isa addition-fact add1 zero add2 nine tens 0 ones 9)
(a10 isa addition-fact add1 one add2 zero tens 0 ones 1)
(a11 isa addition-fact add1 one add2 one tens 0 ones 2)
(a12 isa addition-fact add1 one add2 two tens 0 ones 3)
(a13 isa addition-fact add1 one add2 three tens 0 ones 4)
(a14 isa addition-fact add1 one add2 four tens 0 ones 5)
(a15 isa addition-fact add1 one add2 five tens 0 ones 6)
(a16 isa addition-fact add1 one add2 six tens 0 ones 7)
(a17 isa addition-fact add1 one add2 seven tens 0 ones 8)
(a18 isa addition-fact add1 one add2 eight tens 0 ones 9)
(a19 isa addition-fact add1 one add2 nine tens 1 ones 0)
(a20 isa addition-fact add1 two add2 zero tens 0 ones 2)
(a21 isa addition-fact add1 two add2 one tens 0 ones 3)
(a22 isa addition-fact add1 two add2 two tens 0 ones 4)
(a23 isa addition-fact add1 two add2 three tens 0 ones 5)
(a24 isa addition-fact add1 two add2 four tens 0 ones 6)
(a25 isa addition-fact add1 two add2 five tens 0 ones 7)
(a26 isa addition-fact add1 two add2 six tens 0 ones 8)
(a27 isa addition-fact add1 two add2 seven tens 0 ones 9)
(a28 isa addition-fact add1 two add2 eight tens 1 ones 0)
(a29 isa addition-fact add1 two add2 nine tens 1 ones 1)
(a30 isa addition-fact add1 three add2 zero tens 0 ones 3)
(a31 isa addition-fact add1 three add2 one tens 0 ones 4)
(a32 isa addition-fact add1 three add2 two tens 0 ones 5)
(a33 isa addition-fact add1 three add2 three tens 0 ones 6)
(a34 isa addition-fact add1 three add2 four tens 0 ones 7)
(a35 isa addition-fact add1 three add2 five tens 0 ones 8)
(a36 isa addition-fact add1 three add2 six tens 0 ones 9)
(a37 isa addition-fact add1 three add2 seven tens 1 ones 0)
(a38 isa addition-fact add1 three add2 eight tens 1 ones 1)
(a39 isa addition-fact add1 three add2 nine tens 1 ones 2)
(a40 isa addition-fact add1 four add2 zero tens 0 ones 4)
(a41 isa addition-fact add1 four add2 one tens 0 ones 5)
(a42 isa addition-fact add1 four add2 two tens 0 ones 6)
(a43 isa addition-fact add1 four add2 three tens 0 ones 7)
(a44 isa addition-fact add1 four add2 four tens 0 ones 8)
(a45 isa addition-fact add1 four add2 five tens 0 ones 9)
(a46 isa addition-fact add1 four add2 six tens 1 ones 0)
(a47 isa addition-fact add1 four add2 seven tens 1 ones 1)
(a48 isa addition-fact add1 four add2 eight tens 1 ones 2)
(a49 isa addition-fact add1 four add2 nine tens 1 ones 3)
(a50 isa addition-fact add1 five add2 zero tens 0 ones 5)
(a51 isa addition-fact add1 five add2 one tens 0 ones 6)
(a52 isa addition-fact add1 five add2 two tens 0 ones 7)
(a53 isa addition-fact add1 five add2 three tens 0 ones 8)
(a54 isa addition-fact add1 five add2 four tens 0 ones 9)
(a55 isa addition-fact add1 five add2 five tens 1 ones 0)
(a56 isa addition-fact add1 five add2 six tens 1 ones 1)
(a57 isa addition-fact add1 five add2 seven tens 1 ones 2)
(a58 isa addition-fact add1 five add2 eight tens 1 ones 3)
(a59 isa addition-fact add1 five add2 nine tens 1 ones 4)
(a60 isa addition-fact add1 six add2 zero tens 0 ones 6)
(a61 isa addition-fact add1 six add2 one tens 0 ones 7)
(a62 isa addition-fact add1 six add2 two tens 0 ones 8)
(a63 isa addition-fact add1 six add2 three tens 0 ones 9)
(a64 isa addition-fact add1 six add2 four tens 1 ones 0)
(a65 isa addition-fact add1 six add2 five tens 1 ones 1)
(a66 isa addition-fact add1 six add2 six tens 1 ones 2)
(a67 isa addition-fact add1 six add2 seven tens 1 ones 3)
(a68 isa addition-fact add1 six add2 eight tens 1 ones 4)
(a69 isa addition-fact add1 six add2 nine tens 1 ones 5)
(a70 isa addition-fact add1 seven add2 zero tens 0 ones 7)
(a71 isa addition-fact add1 seven add2 one tens 0 ones 8)
(a72 isa addition-fact add1 seven add2 two tens 0 ones 9)
(a73 isa addition-fact add1 seven add2 three tens 1 ones 0)
(a74 isa addition-fact add1 seven add2 four tens 1 ones 1)
(a75 isa addition-fact add1 seven add2 five tens 1 ones 2)
(a76 isa addition-fact add1 seven add2 six tens 1 ones 3)
(a77 isa addition-fact add1 seven add2 seven tens 1 ones 4)
(a78 isa addition-fact add1 seven add2 eight tens 1 ones 5)
(a79 isa addition-fact add1 seven add2 nine tens 1 ones 6)
(a80 isa addition-fact add1 eight add2 zero tens 0 ones 8)
(a81 isa addition-fact add1 eight add2 one tens 0 ones 9)
(a82 isa addition-fact add1 eight add2 two tens 1 ones 0)
(a83 isa addition-fact add1 eight add2 three tens 1 ones 1)
(a84 isa addition-fact add1 eight add2 four tens 1 ones 2)
(a85 isa addition-fact add1 eight add2 five tens 1 ones 3)
(a86 isa addition-fact add1 eight add2 six tens 1 ones 4)
(a87 isa addition-fact add1 eight add2 seven tens 1 ones 5)
(a88 isa addition-fact add1 eight add2 eight tens 1 ones 6)
(a89 isa addition-fact add1 eight add2 nine tens 1 ones 7)
(a90 isa addition-fact add1 nine add2 zero tens 0 ones 9)
(a91 isa addition-fact add1 nine add2 one tens 1 ones 0)
(a92 isa addition-fact add1 nine add2 two tens 1 ones 1)
(a93 isa addition-fact add1 nine add2 three tens 1 ones 2)
(a94 isa addition-fact add1 nine add2 four tens 1 ones 3)
(a95 isa addition-fact add1 nine add2 five tens 1 ones 4)
(a96 isa addition-fact add1 nine add2 six tens 1 ones 5)
(a97 isa addition-fact add1 nine add2 seven tens 1 ones 6)
(a98 isa addition-fact add1 nine add2 eight tens 1 ones 7)
(a99 isa addition-fact add1 nine add2 nine tens 1 ones 8)
(s0 isa subtraction-fact sub1 zero sub2 zero tens 0 ones 0)
(s1 isa subtraction-fact sub1 zero sub2 one tens 0 ones -1)
(s2 isa subtraction-fact sub1 zero sub2 two tens 0 ones -2)
(s3 isa subtraction-fact sub1 zero sub2 three tens 0 ones -3)
(s4 isa subtraction-fact sub1 zero sub2 four tens 0 ones -4)
(s5 isa subtraction-fact sub1 zero sub2 five tens 0 ones -5)
(s6 isa subtraction-fact sub1 zero sub2 six tens 0 ones -6)
(s7 isa subtraction-fact sub1 zero sub2 seven tens 0 ones -7)
(s8 isa subtraction-fact sub1 zero sub2 eight tens 0 ones -8)
(s9 isa subtraction-fact sub1 zero sub2 nine tens 0 ones -9)
(s10 isa subtraction-fact sub1 one sub2 zero tens 0 ones 1)
(s11 isa subtraction-fact sub1 one sub2 one tens 0 ones 0)
(s12 isa subtraction-fact sub1 one sub2 two tens 0 ones -1)
(s13 isa subtraction-fact sub1 one sub2 three tens 0 ones -2)
(s14 isa subtraction-fact sub1 one sub2 four tens 0 ones -3)
(s15 isa subtraction-fact sub1 one sub2 five tens 0 ones -4)
(s16 isa subtraction-fact sub1 one sub2 six tens 0 ones -5)
(s17 isa subtraction-fact sub1 one sub2 seven tens 0 ones -6)
(s18 isa subtraction-fact sub1 one sub2 eight tens 0 ones -7)
(s19 isa subtraction-fact sub1 one sub2 nine tens 0 ones -8)
(s20 isa subtraction-fact sub1 two sub2 zero tens 0 ones 2)
(s21 isa subtraction-fact sub1 two sub2 one tens 0 ones 1)
(s22 isa subtraction-fact sub1 two sub2 two tens 0 ones 0)
(s23 isa subtraction-fact sub1 two sub2 three tens 0 ones -1)
(s24 isa subtraction-fact sub1 two sub2 four tens 0 ones -2)
(s25 isa subtraction-fact sub1 two sub2 five tens 0 ones -3)
(s26 isa subtraction-fact sub1 two sub2 six tens 0 ones -4)
(s27 isa subtraction-fact sub1 two sub2 seven tens 0 ones -5)
(s28 isa subtraction-fact sub1 two sub2 eight tens 0 ones -6)
(s29 isa subtraction-fact sub1 two sub2 nine tens 0 ones -7)
(s30 isa subtraction-fact sub1 three sub2 zero tens 0 ones 3)
(s31 isa subtraction-fact sub1 three sub2 one tens 0 ones 2)
(s32 isa subtraction-fact sub1 three sub2 two tens 0 ones 1)
(s33 isa subtraction-fact sub1 three sub2 three tens 0 ones 0)
(s34 isa subtraction-fact sub1 three sub2 four tens 0 ones -1)
(s35 isa subtraction-fact sub1 three sub2 five tens 0 ones -2)
(s36 isa subtraction-fact sub1 three sub2 six tens 0 ones -3)
(s37 isa subtraction-fact sub1 three sub2 seven tens 0 ones -4)
(s38 isa subtraction-fact sub1 three sub2 eight tens 0 ones -5)
(s39 isa subtraction-fact sub1 three sub2 nine tens 0 ones -6)
(s40 isa subtraction-fact sub1 four sub2 zero tens 0 ones 4)
(s41 isa subtraction-fact sub1 four sub2 one tens 0 ones 3)
(s42 isa subtraction-fact sub1 four sub2 two tens 0 ones 2)
(s43 isa subtraction-fact sub1 four sub2 three tens 0 ones 1)
(s44 isa subtraction-fact sub1 four sub2 four tens 0 ones 0)
(s45 isa subtraction-fact sub1 four sub2 five tens 0 ones -1)
(s46 isa subtraction-fact sub1 four sub2 six tens 0 ones -2)
(s47 isa subtraction-fact sub1 four sub2 seven tens 0 ones -3)
(s48 isa subtraction-fact sub1 four sub2 eight tens 0 ones -4)
(s49 isa subtraction-fact sub1 four sub2 nine tens 0 ones -5)
(s50 isa subtraction-fact sub1 five sub2 zero tens 0 ones 5)
(s51 isa subtraction-fact sub1 five sub2 one tens 0 ones 4)
(s52 isa subtraction-fact sub1 five sub2 two tens 0 ones 3)
(s53 isa subtraction-fact sub1 five sub2 three tens 0 ones 2)
(s54 isa subtraction-fact sub1 five sub2 four tens 0 ones 1)
(s55 isa subtraction-fact sub1 five sub2 five tens 0 ones 0)
(s56 isa subtraction-fact sub1 five sub2 six tens 0 ones -1)
(s57 isa subtraction-fact sub1 five sub2 seven tens 0 ones -2)
(s58 isa subtraction-fact sub1 five sub2 eight tens 0 ones -3)
(s59 isa subtraction-fact sub1 five sub2 nine tens 0 ones -4)
(s60 isa subtraction-fact sub1 six sub2 zero tens 0 ones 6)
(s61 isa subtraction-fact sub1 six sub2 one tens 0 ones 5)
(s62 isa subtraction-fact sub1 six sub2 two tens 0 ones 4)
(s63 isa subtraction-fact sub1 six sub2 three tens 0 ones 3)
(s64 isa subtraction-fact sub1 six sub2 four tens 0 ones 2)
(s65 isa subtraction-fact sub1 six sub2 five tens 0 ones 1)
(s66 isa subtraction-fact sub1 six sub2 six tens 0 ones 0)
(s67 isa subtraction-fact sub1 six sub2 seven tens 0 ones -1)
(s68 isa subtraction-fact sub1 six sub2 eight tens 0 ones -2)
(s69 isa subtraction-fact sub1 six sub2 nine tens 0 ones -3)
(s70 isa subtraction-fact sub1 seven sub2 zero tens 0 ones 7)
(s71 isa subtraction-fact sub1 seven sub2 one tens 0 ones 6)
(s72 isa subtraction-fact sub1 seven sub2 two tens 0 ones 5)
(s73 isa subtraction-fact sub1 seven sub2 three tens 0 ones 4)
(s74 isa subtraction-fact sub1 seven sub2 four tens 0 ones 3)
(s75 isa subtraction-fact sub1 seven sub2 five tens 0 ones 2)
(s76 isa subtraction-fact sub1 seven sub2 six tens 0 ones 1)
(s77 isa subtraction-fact sub1 seven sub2 seven tens 0 ones 0)
(s78 isa subtraction-fact sub1 seven sub2 eight tens 0 ones -1)
(s79 isa subtraction-fact sub1 seven sub2 nine tens 0 ones -2)
(s80 isa subtraction-fact sub1 eight sub2 zero tens 0 ones 8)
(s81 isa subtraction-fact sub1 eight sub2 one tens 0 ones 7)
(s82 isa subtraction-fact sub1 eight sub2 two tens 0 ones 6)
(s83 isa subtraction-fact sub1 eight sub2 three tens 0 ones 5)
(s84 isa subtraction-fact sub1 eight sub2 four tens 0 ones 4)
(s85 isa subtraction-fact sub1 eight sub2 five tens 0 ones 3)
(s86 isa subtraction-fact sub1 eight sub2 six tens 0 ones 2)
(s87 isa subtraction-fact sub1 eight sub2 seven tens 0 ones 1)
(s88 isa subtraction-fact sub1 eight sub2 eight tens 0 ones 0)
(s89 isa subtraction-fact sub1 eight sub2 nine tens 0 ones -1)
(s90 isa subtraction-fact sub1 nine sub2 zero tens 0 ones 9)
(s91 isa subtraction-fact sub1 nine sub2 one tens 0 ones 8)
(s92 isa subtraction-fact sub1 nine sub2 two tens 0 ones 7)
(s93 isa subtraction-fact sub1 nine sub2 three tens 0 ones 6)
(s94 isa subtraction-fact sub1 nine sub2 four tens 0 ones 5)
(s95 isa subtraction-fact sub1 nine sub2 five tens 0 ones 4)
(s96 isa subtraction-fact sub1 nine sub2 six tens 0 ones 3)
(s97 isa subtraction-fact sub1 nine sub2 seven tens 0 ones 2)
(s98 isa subtraction-fact sub1 nine sub2 eight tens 0 ones 1)
(s99 isa subtraction-fact sub1 nine sub2 nine tens 0 ones 0)
(a10-9 isa addition-fact add1 -9 add2 10 tens 0 ones 1)
(a10-8 isa addition-fact add1 -8 add2 10 tens 0 ones 2)
(a10-7 isa addition-fact add1 -7 add2 10 tens 0 ones 3)
(a10-6 isa addition-fact add1 -6 add2 10 tens 0 ones 4)
(a10-5 isa addition-fact add1 -5 add2 10 tens 0 ones 5)
(a10-4 isa addition-fact add1 -4 add2 10 tens 0 ones 6)
(a10-3 isa addition-fact add1 -3 add2 10 tens 0 ones 7)
(a10-2 isa addition-fact add1 -2 add2 10 tens 0 ones 8)
(a10-1 isa addition-fact add1 -1 add2 10 tens 0 ones 9)


    (goal isa goal state attend) (attend) (retrieve) (encode) (compute) (result)

)
	(set-all-base-levels 100 -100)
	
	(goal-focus goal)

	;; attend to any visual stimuli
	(p attend
		=goal>
			state		attend
		=visual-location>
		?visual>
			state		free
	 ==>
		=goal>
			state		retrieve
	 	+visual>
		 	cmd			move-attention
			screen-pos 	=visual-location
	)
	;; If an integer is attended to, the model will retrieve the representation
	;; based on the visual representation.
	(p retrieve
		=goal>
			state		retrieve
		=visual>
			value		=num1
		  -	value		"+"
		  -	value		"-"
	 ==>
	 	=goal>
			state		encode
		+retrieval>
			isa			number
			visual-rep	=num1

	)
	;; If no number has been encoded before, the model assumes it is the first. 
	;; It will then encode the representation into the imaginal buffer. 
	(p encode-num1
		=goal>
			state		encode
		=retrieval>
		?imaginal>
			state		free
			buffer		empty
	 ==>
		=goal>
			state		attend
		+imaginal>
			isa			problem
			num1		=retrieval
	)

	;; If the model has encoded a number already, it will encode the new number
	;; as the second number in the problem. 
	(p encode-num2
		=goal>
			state		encode
		=retrieval>
		=imaginal>
		  -	num1		nil
		  	num2		nil
	 ==>
		=goal>
			state		attend
		=imaginal>
			isa			problem
			num2		=retrieval
	)

	;; This production will retrieve the addition fact because it saw an addition
	;; symbol and it will use the prior two numbers it encoded.
	(p retrieve-addition-operator
		=goal>
			state		retrieve
		=visual>
			value		=op
			value		"+"
		=imaginal>
			num1		=n1
			num2		=n2
	 ==>
	 	=goal>
			state		compute
		=imaginal>
		+retrieval>
			isa			addition-fact
			add1		=n1
			add2		=n2
	)
	;; This production will retrieve the subtraction fact because it saw a minus
	;; symbol and it will use the prior two numbers it encoded.
	(p retrieve-subtraction-operator
		=goal>
			state		retrieve
		=visual>
			value		=op
			value		"-"
		=imaginal>
			num1		=n1
			num2		=n2
	 ==>
	 	=goal>
			state		compute
		=imaginal>
		+retrieval>
			isa			subtraction-fact
			sub1		=n1
			sub2		=n2
	)

	;; The model will retrieve an addition fact with incomplete information. It 
	;; only saw one number so it will try to retrieve a fact with that number. 
	(p retrieve-incomplete-addition-operator
		=goal>
			state		retrieve
		=visual>
			value		=op
			value		"+"
		=imaginal>
			num1		=n1
			num2		nil
	 ==>
	 	=goal>
			state		compute
		=imaginal>
		+retrieval>
			isa			addition-fact
			add1		=n1
	)
	;; The model will retrieve a subtraction fact with incomplete information. It 
	;; only saw one number so it will try to retrieve a fact with that number. 
	(p retrieve-incomplete-subtraction-operator
		=goal>
			state		retrieve
		=visual>
			value		=op
			value		"-"
		=imaginal>
			num1		=n1
			num2		nil
	 ==>
	 	=goal>
			state		compute
		=imaginal>
		+retrieval>
			isa			subtraction-fact
			sub1		=n1
	)

	;; This production will fire if the result of the math fact is 10 or greater.
	;; It will then try to retrieve the difference betweeen the result and 10. 
	(p result-equal-or-above-10
		=goal>
			state		compute
		=retrieval>
			ones		=an
		  	tens		1
		=imaginal>
	 ==>
		=goal>
			state		result
		=imaginal>
		+retrieval>
			isa			number
			numerical-rep		=an
	)
	;; This production will fire if the result of the math fact is less than 0.
	;; It will then try to retrieve the sum of the result and 10. 
	(p result-less-than-0
		=goal>
			state		compute
		=imaginal>
		=retrieval>
			ones		=an
		  < ones		0
	 ==>
	 	=goal>
		 	state		compute
		=imaginal>
		+retrieval>
			isa			addition-fact
			add1		=an
	)
	;; This production will fire if the result of the math fact is between 0-9
	;; inclusively. It will then retrieve the visual representation of the result. 
	(p result
		=goal>
			state		compute
		=imaginal>
		=retrieval>
			ones		=an
			tens		0
	 ==>
		=goal>
			state		result
		=imaginal>
		+retrieval>
			isa			number
			numerical-rep		=an
	)

	;; This production will fire once the model retrieves the visual representation
	;; of the result of the problem. It will then press the key corresponding to 
	;; the result. 
	(p report 
		=goal>
			state		result
		=retrieval>
			isa			number
			visual-rep	=num
		?manual>
			state		free
	 ==>
	 	=goal>
			state		attend
		@imaginal>
		+manual>
			cmd			press-key
			key			=num
		;;!output!		=num
	)

	(Set-similarities
		(zero one -0.1)
		(zero two -0.2)
		(zero three -0.30000000000000004)
		(zero four -0.4)
		(zero five -0.5)
		(zero six -0.6000000000000001)
		(zero seven -0.7000000000000001)
		(zero eight -0.8)
		(zero nine -0.9)
		(one two -0.1)
		(one three -0.2)
		(one four -0.30000000000000004)
		(one five -0.4)
		(one six -0.5)
		(one seven -0.6000000000000001)
		(one eight -0.7000000000000001)
		(one nine -0.8)
		(two three -0.1)
		(two four -0.2)
		(two five -0.30000000000000004)
		(two six -0.4)
		(two seven -0.5)
		(two eight -0.6000000000000001)
		(two nine -0.7000000000000001)
		(three four -0.1)
		(three five -0.2)
		(three six -0.30000000000000004)
		(three seven -0.4)
		(three eight -0.5)
		(three nine -0.6000000000000001)
		(four five -0.1)
		(four six -0.2)
		(four seven -0.30000000000000004)
		(four eight -0.4)
		(four nine -0.5)
		(five six -0.1)
		(five seven -0.2)
		(five eight -0.30000000000000004)
		(five nine -0.4)
		(six seven -0.1)
		(six eight -0.2)
		(six nine -0.30000000000000004)
		(seven eight -0.1)
		(seven nine -0.2)
		(eight nine -0.1)
	)
)
