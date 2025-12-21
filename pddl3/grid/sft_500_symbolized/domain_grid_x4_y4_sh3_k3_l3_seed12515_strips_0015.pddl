(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v8 ?v13)
             (pred_5 ?v10 ?v1)
             (pred_8 ?v8 ?v1)
             (pred_10 ?v12 ?v8 )
	     (pred_2 ?v8)
             (pred_6 ?v6)
             (pred_1 ?v10)
             (pred_7 ?v1)
             (pred_3 ?v8)
             (pred_11 ?v10)
             (pred_9 ?v8)
             (pred_12 ))



(:action op_3
:parameters (?v9 ?v3 ?v5 ?v4)
:precondition (and (pred_6 ?v9) (pred_6 ?v3) (pred_1 ?v5) (pred_7 ?v4)
          (pred_4 ?v9 ?v3) (pred_5 ?v5 ?v4)
                   (pred_8 ?v3 ?v4) (pred_2 ?v9) 
                   (pred_3 ?v3) (pred_11 ?v5))
:effect (and  (pred_9 ?v3) (not (pred_3 ?v3))))


(:action op_1
:parameters (?v9 ?v2)
:precondition (and (pred_6 ?v9) (pred_6 ?v2)
               (pred_2 ?v9) (pred_4 ?v9 ?v2) (pred_9 ?v2))
:effect (and (pred_2 ?v2) (not (pred_2 ?v9))))

(:action op_4
:parameters (?v9 ?v5)
:precondition (and (pred_6 ?v9) (pred_1 ?v5) 
                  (pred_2 ?v9) (pred_10 ?v5 ?v9) (pred_12 ))
:effect (and (pred_11 ?v5)
   (not (pred_10 ?v5 ?v9)) (not (pred_12 ))))


(:action op_5
:parameters (?v9 ?v11 ?v7)
:precondition (and (pred_6 ?v9) (pred_1 ?v11) (pred_1 ?v7)
                  (pred_2 ?v9) (pred_11 ?v7) (pred_10 ?v11 ?v9))
:effect (and (pred_11 ?v11) (pred_10 ?v7 ?v9)
        (not (pred_11 ?v7)) (not (pred_10 ?v11 ?v9))))

(:action op_2
:parameters (?v9 ?v5)
:precondition (and (pred_6 ?v9) (pred_1 ?v5) 
                  (pred_2 ?v9) (pred_11 ?v5))
:effect (and (pred_12 ) (pred_10 ?v5 ?v9) (not (pred_11 ?v5)))))


	
