(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v8 ?v11)
             (pred_10 ?v13 ?v7)
             (pred_4 ?v8 ?v7)
             (pred_2 ?v1 ?v8 )
	     (pred_8 ?v8)
             (pred_12 ?v12)
             (pred_9 ?v13)
             (pred_7 ?v7)
             (pred_3 ?v8)
             (pred_11 ?v13)
             (pred_6 ?v8)
             (pred_1 ))



(:action op_4
:parameters (?v3 ?v2 ?v10 ?v6)
:precondition (and (pred_12 ?v3) (pred_12 ?v2) (pred_9 ?v10) (pred_7 ?v6)
          (pred_5 ?v3 ?v2) (pred_10 ?v10 ?v6)
                   (pred_4 ?v2 ?v6) (pred_8 ?v3) 
                   (pred_3 ?v2) (pred_11 ?v10))
:effect (and  (pred_6 ?v2) (not (pred_3 ?v2))))


(:action op_1
:parameters (?v3 ?v5)
:precondition (and (pred_12 ?v3) (pred_12 ?v5)
               (pred_8 ?v3) (pred_5 ?v3 ?v5) (pred_6 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v3))))

(:action op_3
:parameters (?v3 ?v10)
:precondition (and (pred_12 ?v3) (pred_9 ?v10) 
                  (pred_8 ?v3) (pred_2 ?v10 ?v3) (pred_1 ))
:effect (and (pred_11 ?v10)
   (not (pred_2 ?v10 ?v3)) (not (pred_1 ))))


(:action op_5
:parameters (?v3 ?v4 ?v9)
:precondition (and (pred_12 ?v3) (pred_9 ?v4) (pred_9 ?v9)
                  (pred_8 ?v3) (pred_11 ?v9) (pred_2 ?v4 ?v3))
:effect (and (pred_11 ?v4) (pred_2 ?v9 ?v3)
        (not (pred_11 ?v9)) (not (pred_2 ?v4 ?v3))))

(:action op_2
:parameters (?v3 ?v10)
:precondition (and (pred_12 ?v3) (pred_9 ?v10) 
                  (pred_8 ?v3) (pred_11 ?v10))
:effect (and (pred_1 ) (pred_2 ?v10 ?v3) (not (pred_11 ?v10)))))


	
