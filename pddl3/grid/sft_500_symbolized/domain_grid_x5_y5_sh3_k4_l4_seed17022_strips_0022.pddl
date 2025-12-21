(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v13 ?v6)
             (pred_11 ?v10 ?v12)
             (pred_12 ?v13 ?v12)
             (pred_5 ?v4 ?v13 )
	     (pred_7 ?v13)
             (pred_2 ?v1)
             (pred_3 ?v10)
             (pred_4 ?v12)
             (pred_8 ?v13)
             (pred_10 ?v10)
             (pred_6 ?v13)
             (pred_9 ))



(:action op_3
:parameters (?v9 ?v3 ?v8 ?v2)
:precondition (and (pred_2 ?v9) (pred_2 ?v3) (pred_3 ?v8) (pred_4 ?v2)
          (pred_1 ?v9 ?v3) (pred_11 ?v8 ?v2)
                   (pred_12 ?v3 ?v2) (pred_7 ?v9) 
                   (pred_8 ?v3) (pred_10 ?v8))
:effect (and  (pred_6 ?v3) (not (pred_8 ?v3))))


(:action op_1
:parameters (?v9 ?v11)
:precondition (and (pred_2 ?v9) (pred_2 ?v11)
               (pred_7 ?v9) (pred_1 ?v9 ?v11) (pred_6 ?v11))
:effect (and (pred_7 ?v11) (not (pred_7 ?v9))))

(:action op_4
:parameters (?v9 ?v8)
:precondition (and (pred_2 ?v9) (pred_3 ?v8) 
                  (pred_7 ?v9) (pred_5 ?v8 ?v9) (pred_9 ))
:effect (and (pred_10 ?v8)
   (not (pred_5 ?v8 ?v9)) (not (pred_9 ))))


(:action op_5
:parameters (?v9 ?v5 ?v7)
:precondition (and (pred_2 ?v9) (pred_3 ?v5) (pred_3 ?v7)
                  (pred_7 ?v9) (pred_10 ?v7) (pred_5 ?v5 ?v9))
:effect (and (pred_10 ?v5) (pred_5 ?v7 ?v9)
        (not (pred_10 ?v7)) (not (pred_5 ?v5 ?v9))))

(:action op_2
:parameters (?v9 ?v8)
:precondition (and (pred_2 ?v9) (pred_3 ?v8) 
                  (pred_7 ?v9) (pred_10 ?v8))
:effect (and (pred_9 ) (pred_5 ?v8 ?v9) (not (pred_10 ?v8)))))


	
