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
		:ans 0.2
		:mp 20
		:rt -.45		;; This increases with fatigue
		:ms 0
		:md -1.0	
		;; :ut -65
)

  ;; do not change these parameters
;; (sgp :esc t :bll .5 :ol t :sim-hook "similarity" :cache-sim-hook-results t :er t :lf 0)
;; Mathematic expertise is expected, so there should be fast accurate access to the facts.
;; Model is presented one-digit addition and subtraction problems. If the result is greater than 
;; 10, the participant subtracts 10 and response with that result. If the result is of a subtract
;; is less than 0, the model responds by adding 10 to that number. The model is presented num1 for
;; 200 ms, followed by blank for 200 ms, followed by num2 for 200 ms, followed by blank for 200ms, 
;; followed by operator. with the next trial beginning 500 ms after the response. The
;; task ended after 50 responses and typically took 3 to 4 min.

;; 3 places retrieval can go wrong: encoding from screen, retrieving facts from memory
;; and retrieving the representation of the response digit. 

;; This chunk will be used to translate the visual representation to the slot representation. 
(chunk-type number visual-rep num-rep)
;; This chunk will be used to represent addition-facts
(chunk-type addition-fact add1 add2 ans)
;; This chunk will be used to represent subtraction-facts
(chunk-type subtraction-fact sub1 sub2 ans)
;; This chunk will be used to represent the problem in the imaginal buffer
(chunk-type problem num1 num2 ans)
;; This chunk will be used to represent the goal as a way of controlling flow
(chunk-type goal state)

(add-dm
	(a00 isa addition-fact add1 0 add2 0 ans 0)
	(a01 isa addition-fact add1 0 add2 1 ans 1)
	(a02 isa addition-fact add1 0 add2 2 ans 2)
	(a03 isa addition-fact add1 0 add2 3 ans 3)
	(a04 isa addition-fact add1 0 add2 4 ans 4)
	(a05 isa addition-fact add1 0 add2 5 ans 5)
	(a06 isa addition-fact add1 0 add2 6 ans 6)
	(a07 isa addition-fact add1 0 add2 7 ans 7)
	(a08 isa addition-fact add1 0 add2 8 ans 8)
	(a09 isa addition-fact add1 0 add2 9 ans 9)
	(a10 isa addition-fact add1 1 add2 0 ans 1)
	(a11 isa addition-fact add1 1 add2 1 ans 2)
	(a12 isa addition-fact add1 1 add2 2 ans 3)
	(a13 isa addition-fact add1 1 add2 3 ans 4)
	(a14 isa addition-fact add1 1 add2 4 ans 5)
	(a15 isa addition-fact add1 1 add2 5 ans 6)
	(a16 isa addition-fact add1 1 add2 6 ans 7)
	(a17 isa addition-fact add1 1 add2 7 ans 8)
	(a18 isa addition-fact add1 1 add2 8 ans 9)
	(a19 isa addition-fact add1 1 add2 9 ans 10)
	(a20 isa addition-fact add1 2 add2 0 ans 2)
	(a21 isa addition-fact add1 2 add2 1 ans 3)
	(a22 isa addition-fact add1 2 add2 2 ans 4)
	(a23 isa addition-fact add1 2 add2 3 ans 5)
	(a24 isa addition-fact add1 2 add2 4 ans 6)
	(a25 isa addition-fact add1 2 add2 5 ans 7)
	(a26 isa addition-fact add1 2 add2 6 ans 8)
	(a27 isa addition-fact add1 2 add2 7 ans 9)
	(a28 isa addition-fact add1 2 add2 8 ans 10)
	(a29 isa addition-fact add1 2 add2 9 ans 11)
	(a30 isa addition-fact add1 3 add2 0 ans 3)
	(a31 isa addition-fact add1 3 add2 1 ans 4)
	(a32 isa addition-fact add1 3 add2 2 ans 5)
	(a33 isa addition-fact add1 3 add2 3 ans 6)
	(a34 isa addition-fact add1 3 add2 4 ans 7)
	(a35 isa addition-fact add1 3 add2 5 ans 8)
	(a36 isa addition-fact add1 3 add2 6 ans 9)
	(a37 isa addition-fact add1 3 add2 7 ans 10)
	(a38 isa addition-fact add1 3 add2 8 ans 11)
	(a39 isa addition-fact add1 3 add2 9 ans 12)
	(a40 isa addition-fact add1 4 add2 0 ans 4)
	(a41 isa addition-fact add1 4 add2 1 ans 5)
	(a42 isa addition-fact add1 4 add2 2 ans 6)
	(a43 isa addition-fact add1 4 add2 3 ans 7)
	(a44 isa addition-fact add1 4 add2 4 ans 8)
	(a45 isa addition-fact add1 4 add2 5 ans 9)
	(a46 isa addition-fact add1 4 add2 6 ans 10)
	(a47 isa addition-fact add1 4 add2 7 ans 11)
	(a48 isa addition-fact add1 4 add2 8 ans 12)
	(a49 isa addition-fact add1 4 add2 9 ans 13)
	(a50 isa addition-fact add1 5 add2 0 ans 5)
	(a51 isa addition-fact add1 5 add2 1 ans 6)
	(a52 isa addition-fact add1 5 add2 2 ans 7)
	(a53 isa addition-fact add1 5 add2 3 ans 8)
	(a54 isa addition-fact add1 5 add2 4 ans 9)
	(a55 isa addition-fact add1 5 add2 5 ans 10)
	(a56 isa addition-fact add1 5 add2 6 ans 11)
	(a57 isa addition-fact add1 5 add2 7 ans 12)
	(a58 isa addition-fact add1 5 add2 8 ans 13)
	(a59 isa addition-fact add1 5 add2 9 ans 14)
	(a60 isa addition-fact add1 6 add2 0 ans 6)
	(a61 isa addition-fact add1 6 add2 1 ans 7)
	(a62 isa addition-fact add1 6 add2 2 ans 8)
	(a63 isa addition-fact add1 6 add2 3 ans 9)
	(a64 isa addition-fact add1 6 add2 4 ans 10)
	(a65 isa addition-fact add1 6 add2 5 ans 11)
	(a66 isa addition-fact add1 6 add2 6 ans 12)
	(a67 isa addition-fact add1 6 add2 7 ans 13)
	(a68 isa addition-fact add1 6 add2 8 ans 14)
	(a69 isa addition-fact add1 6 add2 9 ans 15)
	(a70 isa addition-fact add1 7 add2 0 ans 7)
	(a71 isa addition-fact add1 7 add2 1 ans 8)
	(a72 isa addition-fact add1 7 add2 2 ans 9)
	(a73 isa addition-fact add1 7 add2 3 ans 10)
	(a74 isa addition-fact add1 7 add2 4 ans 11)
	(a75 isa addition-fact add1 7 add2 5 ans 12)
	(a76 isa addition-fact add1 7 add2 6 ans 13)
	(a77 isa addition-fact add1 7 add2 7 ans 14)
	(a78 isa addition-fact add1 7 add2 8 ans 15)
	(a79 isa addition-fact add1 7 add2 9 ans 16)
	(a80 isa addition-fact add1 8 add2 0 ans 8)
	(a81 isa addition-fact add1 8 add2 1 ans 9)
	(a82 isa addition-fact add1 8 add2 2 ans 10)
	(a83 isa addition-fact add1 8 add2 3 ans 11)
	(a84 isa addition-fact add1 8 add2 4 ans 12)
	(a85 isa addition-fact add1 8 add2 5 ans 13)
	(a86 isa addition-fact add1 8 add2 6 ans 14)
	(a87 isa addition-fact add1 8 add2 7 ans 15)
	(a88 isa addition-fact add1 8 add2 8 ans 16)
	(a89 isa addition-fact add1 8 add2 9 ans 17)
	(a90 isa addition-fact add1 9 add2 0 ans 9)
	(a91 isa addition-fact add1 9 add2 1 ans 10)
	(a92 isa addition-fact add1 9 add2 2 ans 11)
	(a93 isa addition-fact add1 9 add2 3 ans 12)
	(a94 isa addition-fact add1 9 add2 4 ans 13)
	(a95 isa addition-fact add1 9 add2 5 ans 14)
	(a96 isa addition-fact add1 9 add2 6 ans 15)
	(a97 isa addition-fact add1 9 add2 7 ans 16)
	(a98 isa addition-fact add1 9 add2 8 ans 17)
	(a99 isa addition-fact add1 9 add2 9 ans 18)
	(a10-9 isa addition-fact add1 -9 add2 10 ans 1)
	(a10-8 isa addition-fact add1 -8 add2 10 ans 2)
	(a10-7 isa addition-fact add1 -7 add2 10 ans 3)
	(a10-6 isa addition-fact add1 -6 add2 10 ans 4)
	(a10-5 isa addition-fact add1 -5 add2 10 ans 5)
	(a10-4 isa addition-fact add1 -4 add2 10 ans 6)
	(a10-3 isa addition-fact add1 -3 add2 10 ans 7)
	(a10-2 isa addition-fact add1 -2 add2 10 ans 8)
	(a10-1 isa addition-fact add1 -1 add2 10 ans 9)
	(s00 isa subtraction-fact sub1 0 sub2 0 ans 0)
	(s01 isa subtraction-fact sub1 0 sub2 1 ans -1)
	(s02 isa subtraction-fact sub1 0 sub2 2 ans -2)
	(s03 isa subtraction-fact sub1 0 sub2 3 ans -3)
	(s04 isa subtraction-fact sub1 0 sub2 4 ans -4)
	(s05 isa subtraction-fact sub1 0 sub2 5 ans -5)
	(s06 isa subtraction-fact sub1 0 sub2 6 ans -6)
	(s07 isa subtraction-fact sub1 0 sub2 7 ans -7)
	(s08 isa subtraction-fact sub1 0 sub2 8 ans -8)
	(s09 isa subtraction-fact sub1 0 sub2 9 ans -9)
	(s10 isa subtraction-fact sub1 1 sub2 0 ans 1)
	(s11 isa subtraction-fact sub1 1 sub2 1 ans 0)
	(s12 isa subtraction-fact sub1 1 sub2 2 ans -1)
	(s13 isa subtraction-fact sub1 1 sub2 3 ans -2)
	(s14 isa subtraction-fact sub1 1 sub2 4 ans -3)
	(s15 isa subtraction-fact sub1 1 sub2 5 ans -4)
	(s16 isa subtraction-fact sub1 1 sub2 6 ans -5)
	(s17 isa subtraction-fact sub1 1 sub2 7 ans -6)
	(s18 isa subtraction-fact sub1 1 sub2 8 ans -7)
	(s19 isa subtraction-fact sub1 1 sub2 9 ans -8)
	(s20 isa subtraction-fact sub1 2 sub2 0 ans 2)
	(s21 isa subtraction-fact sub1 2 sub2 1 ans 1)
	(s22 isa subtraction-fact sub1 2 sub2 2 ans 0)
	(s23 isa subtraction-fact sub1 2 sub2 3 ans -1)
	(s24 isa subtraction-fact sub1 2 sub2 4 ans -2)
	(s25 isa subtraction-fact sub1 2 sub2 5 ans -3)
	(s26 isa subtraction-fact sub1 2 sub2 6 ans -4)
	(s27 isa subtraction-fact sub1 2 sub2 7 ans -5)
	(s28 isa subtraction-fact sub1 2 sub2 8 ans -6)
	(s29 isa subtraction-fact sub1 2 sub2 9 ans -7)
	(s30 isa subtraction-fact sub1 3 sub2 0 ans 3)
	(s31 isa subtraction-fact sub1 3 sub2 1 ans 2)
	(s32 isa subtraction-fact sub1 3 sub2 2 ans 1)
	(s33 isa subtraction-fact sub1 3 sub2 3 ans 0)
	(s34 isa subtraction-fact sub1 3 sub2 4 ans -1)
	(s35 isa subtraction-fact sub1 3 sub2 5 ans -2)
	(s36 isa subtraction-fact sub1 3 sub2 6 ans -3)
	(s37 isa subtraction-fact sub1 3 sub2 7 ans -4)
	(s38 isa subtraction-fact sub1 3 sub2 8 ans -5)
	(s39 isa subtraction-fact sub1 3 sub2 9 ans -6)
	(s40 isa subtraction-fact sub1 4 sub2 0 ans 4)
	(s41 isa subtraction-fact sub1 4 sub2 1 ans 3)
	(s42 isa subtraction-fact sub1 4 sub2 2 ans 2)
	(s43 isa subtraction-fact sub1 4 sub2 3 ans 1)
	(s44 isa subtraction-fact sub1 4 sub2 4 ans 0)
	(s45 isa subtraction-fact sub1 4 sub2 5 ans -1)
	(s46 isa subtraction-fact sub1 4 sub2 6 ans -2)
	(s47 isa subtraction-fact sub1 4 sub2 7 ans -3)
	(s48 isa subtraction-fact sub1 4 sub2 8 ans -4)
	(s49 isa subtraction-fact sub1 4 sub2 9 ans -5)
	(s50 isa subtraction-fact sub1 5 sub2 0 ans 5)
	(s51 isa subtraction-fact sub1 5 sub2 1 ans 4)
	(s52 isa subtraction-fact sub1 5 sub2 2 ans 3)
	(s53 isa subtraction-fact sub1 5 sub2 3 ans 2)
	(s54 isa subtraction-fact sub1 5 sub2 4 ans 1)
	(s55 isa subtraction-fact sub1 5 sub2 5 ans 0)
	(s56 isa subtraction-fact sub1 5 sub2 6 ans -1)
	(s57 isa subtraction-fact sub1 5 sub2 7 ans -2)
	(s58 isa subtraction-fact sub1 5 sub2 8 ans -3)
	(s59 isa subtraction-fact sub1 5 sub2 9 ans -4)
	(s60 isa subtraction-fact sub1 6 sub2 0 ans 6)
	(s61 isa subtraction-fact sub1 6 sub2 1 ans 5)
	(s62 isa subtraction-fact sub1 6 sub2 2 ans 4)
	(s63 isa subtraction-fact sub1 6 sub2 3 ans 3)
	(s64 isa subtraction-fact sub1 6 sub2 4 ans 2)
	(s65 isa subtraction-fact sub1 6 sub2 5 ans 1)
	(s66 isa subtraction-fact sub1 6 sub2 6 ans 0)
	(s67 isa subtraction-fact sub1 6 sub2 7 ans -1)
	(s68 isa subtraction-fact sub1 6 sub2 8 ans -2)
	(s69 isa subtraction-fact sub1 6 sub2 9 ans -3)
	(s70 isa subtraction-fact sub1 7 sub2 0 ans 7)
	(s71 isa subtraction-fact sub1 7 sub2 1 ans 6)
	(s72 isa subtraction-fact sub1 7 sub2 2 ans 5)
	(s73 isa subtraction-fact sub1 7 sub2 3 ans 4)
	(s74 isa subtraction-fact sub1 7 sub2 4 ans 3)
	(s75 isa subtraction-fact sub1 7 sub2 5 ans 2)
	(s76 isa subtraction-fact sub1 7 sub2 6 ans 1)
	(s77 isa subtraction-fact sub1 7 sub2 7 ans 0)
	(s78 isa subtraction-fact sub1 7 sub2 8 ans -1)
	(s79 isa subtraction-fact sub1 7 sub2 9 ans -2)
	(s80 isa subtraction-fact sub1 8 sub2 0 ans 8)
	(s81 isa subtraction-fact sub1 8 sub2 1 ans 7)
	(s82 isa subtraction-fact sub1 8 sub2 2 ans 6)
	(s83 isa subtraction-fact sub1 8 sub2 3 ans 5)
	(s84 isa subtraction-fact sub1 8 sub2 4 ans 4)
	(s85 isa subtraction-fact sub1 8 sub2 5 ans 3)
	(s86 isa subtraction-fact sub1 8 sub2 6 ans 2)
	(s87 isa subtraction-fact sub1 8 sub2 7 ans 1)
	(s88 isa subtraction-fact sub1 8 sub2 8 ans 0)
	(s89 isa subtraction-fact sub1 8 sub2 9 ans -1)
	(s90 isa subtraction-fact sub1 9 sub2 0 ans 9)
	(s91 isa subtraction-fact sub1 9 sub2 1 ans 8)
	(s92 isa subtraction-fact sub1 9 sub2 2 ans 7)
	(s93 isa subtraction-fact sub1 9 sub2 3 ans 6)
	(s94 isa subtraction-fact sub1 9 sub2 4 ans 5)
	(s95 isa subtraction-fact sub1 9 sub2 5 ans 4)
	(s96 isa subtraction-fact sub1 9 sub2 6 ans 3)
	(s97 isa subtraction-fact sub1 9 sub2 7 ans 2)
	(s98 isa subtraction-fact sub1 9 sub2 8 ans 1)
	(s99 isa subtraction-fact sub1 9 sub2 9 ans 0)
	(s1010 isa subtraction-fact sub1 10 sub2 10 ans 0)
	(s1110 isa subtraction-fact sub1 11 sub2 10 ans 1)
	(s1210 isa subtraction-fact sub1 12 sub2 10 ans 2)
	(s1310 isa subtraction-fact sub1 13 sub2 10 ans 3)
	(s1410 isa subtraction-fact sub1 14 sub2 10 ans 4)
	(s1510 isa subtraction-fact sub1 15 sub2 10 ans 5)
	(s1610 isa subtraction-fact sub1 16 sub2 10 ans 6)
	(s1710 isa subtraction-fact sub1 17 sub2 10 ans 7)
	(s1810 isa subtraction-fact sub1 18 sub2 10 ans 8)
	(s1910 isa subtraction-fact sub1 19 sub2 10 ans 9)
	(zero ISA number visual-rep "0" num-rep 0)
	(one ISA number visual-rep "1" num-rep 1)
	(two ISA number visual-rep "2" num-rep 2)
	(three ISA number visual-rep "3" num-rep 3)
	(four ISA number visual-rep "4" num-rep 4)
	(five ISA number visual-rep "5" num-rep 5)
	(six ISA number visual-rep "6" num-rep 6)
	(seven ISA number visual-rep "7" num-rep 7)
	(eight ISA number visual-rep "8" num-rep 8)
	(nine ISA number visual-rep "9" num-rep 9)

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
	;; retrieve the slot representation of the numbers of the problem
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
	;; Encode the slot representation of the first number
	(p encode-num1
		=goal>
			state		encode
		=retrieval>
			isa			number
			num-rep		=num1
		?imaginal>
			state		free
			buffer		empty
	 ==>
		=goal>
			state		attend
		+imaginal>
			isa			problem
			num1		=num1
	)

	;; Encode the slot representation of the second number
	(p encode-num2
		=goal>
			state		encode
		=retrieval>
			isa			number
			num-rep		=num2
		=imaginal>
		  -	num1		nil
		  	num2		nil
	 ==>
		=goal>
			state		attend
		=imaginal>
			isa			problem
			num2		=num2
	)

	;; Encode addition operator and retrieve addition fact
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
	;; Encode subtraction operator and retrieve subtraction fact
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

	;; If the model has a failure to encode the problem completely it should
	;; try to retrieve any fact that fits
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

	;; If answer is 10 or above
	(p result-equal-or-above-10
		=goal>
			state		compute
		=retrieval>
			ans			=an
		 >=	ans			10
		=imaginal>
	 ==>
		=goal>
			state		compute
		=imaginal>
		+retrieval>
			isa			subtraction-fact
			sub1		=an
	)
	;; if answer is below 0
	(p result-less-than-0
		=goal>
			state		compute
		=imaginal>
		=retrieval>
			ans			=an
		  < ans			0
	 ==>
	 	=goal>
		 	state		compute
		=imaginal>
		+retrieval>
			isa			addition-fact
			add1		=an
	)
	;; If answer is from 0-9
	(p result
		=goal>
			state		compute
		=imaginal>
		=retrieval>
			ans			=an
		  < ans			10
		  > ans			-1
	 ==>
		=goal>
			state		result
		=imaginal>
			ans			=an
		+retrieval>
			isa			number
			num-rep		=an
	)

	;; Report the results
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
		!output!		=num
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
