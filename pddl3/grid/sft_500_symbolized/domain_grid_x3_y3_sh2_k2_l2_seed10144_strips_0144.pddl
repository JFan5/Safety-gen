(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v7 ?v10)
             (pred_5 ?v2 ?v13)
             (pred_1 ?v7 ?v13)
             (pred_2 ?v11 ?v7 )
	     (pred_11 ?v7)
             (pred_6 ?v9)
             (pred_4 ?v2)
             (pred_3 ?v13)
             (pred_8 ?v7)
             (pred_12 ?v2)
             (pred_7 ?v7)
             (pred_9 ))



(:action op_5
:parameters (?v3 ?v4 ?v8 ?v5)
:precondition (and (pred_6 ?v3) (pred_6 ?v4) (pred_4 ?v8) (pred_3 ?v5)
          (pred_10 ?v3 ?v4) (pred_5 ?v8 ?v5)
                   (pred_1 ?v4 ?v5) (pred_11 ?v3) 
                   (pred_8 ?v4) (pred_12 ?v8))
:effect (and  (pred_7 ?v4) (not (pred_8 ?v4))))


(:action op_3
:parameters (?v3 ?v12)
:precondition (and (pred_6 ?v3) (pred_6 ?v12)
               (pred_11 ?v3) (pred_10 ?v3 ?v12) (pred_7 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v3))))

(:action op_4
:parameters (?v3 ?v8)
:precondition (and (pred_6 ?v3) (pred_4 ?v8) 
                  (pred_11 ?v3) (pred_2 ?v8 ?v3) (pred_9 ))
:effect (and (pred_12 ?v8)
   (not (pred_2 ?v8 ?v3)) (not (pred_9 ))))


(:action op_1
:parameters (?v3 ?v6 ?v1)
:precondition (and (pred_6 ?v3) (pred_4 ?v6) (pred_4 ?v1)
                  (pred_11 ?v3) (pred_12 ?v1) (pred_2 ?v6 ?v3))
:effect (and (pred_12 ?v6) (pred_2 ?v1 ?v3)
        (not (pred_12 ?v1)) (not (pred_2 ?v6 ?v3))))

(:action op_2
:parameters (?v3 ?v8)
:precondition (and (pred_6 ?v3) (pred_4 ?v8) 
                  (pred_11 ?v3) (pred_12 ?v8))
:effect (and (pred_9 ) (pred_2 ?v8 ?v3) (not (pred_12 ?v8)))))


	
