(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v3 ?v8)
             (pred_8 ?v7 ?v5)
             (pred_4 ?v3 ?v5)
             (pred_5 ?v10 ?v3 )
	     (pred_6 ?v3)
             (pred_10 ?v4)
             (pred_7 ?v7)
             (pred_12 ?v5)
             (pred_1 ?v3)
             (pred_2 ?v7)
             (pred_9 ?v3)
             (pred_11 ))



(:action op_1
:parameters (?v11 ?v1 ?v6 ?v2)
:precondition (and (pred_10 ?v11) (pred_10 ?v1) (pred_7 ?v6) (pred_12 ?v2)
          (pred_3 ?v11 ?v1) (pred_8 ?v6 ?v2)
                   (pred_4 ?v1 ?v2) (pred_6 ?v11) 
                   (pred_1 ?v1) (pred_2 ?v6))
:effect (and  (pred_9 ?v1) (not (pred_1 ?v1))))


(:action op_5
:parameters (?v11 ?v9)
:precondition (and (pred_10 ?v11) (pred_10 ?v9)
               (pred_6 ?v11) (pred_3 ?v11 ?v9) (pred_9 ?v9))
:effect (and (pred_6 ?v9) (not (pred_6 ?v11))))

(:action op_4
:parameters (?v11 ?v6)
:precondition (and (pred_10 ?v11) (pred_7 ?v6) 
                  (pred_6 ?v11) (pred_5 ?v6 ?v11) (pred_11 ))
:effect (and (pred_2 ?v6)
   (not (pred_5 ?v6 ?v11)) (not (pred_11 ))))


(:action op_2
:parameters (?v11 ?v12 ?v13)
:precondition (and (pred_10 ?v11) (pred_7 ?v12) (pred_7 ?v13)
                  (pred_6 ?v11) (pred_2 ?v13) (pred_5 ?v12 ?v11))
:effect (and (pred_2 ?v12) (pred_5 ?v13 ?v11)
        (not (pred_2 ?v13)) (not (pred_5 ?v12 ?v11))))

(:action op_3
:parameters (?v11 ?v6)
:precondition (and (pred_10 ?v11) (pred_7 ?v6) 
                  (pred_6 ?v11) (pred_2 ?v6))
:effect (and (pred_11 ) (pred_5 ?v6 ?v11) (not (pred_2 ?v6)))))


	
