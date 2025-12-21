(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v12 ?v8)
             (pred_8 ?v13 ?v6)
             (pred_2 ?v12 ?v6)
             (pred_11 ?v11 ?v12 )
	     (pred_10 ?v12)
             (pred_6 ?v9)
             (pred_1 ?v13)
             (pred_5 ?v6)
             (pred_12 ?v12)
             (pred_4 ?v13)
             (pred_7 ?v12)
             (pred_3 ))



(:action op_2
:parameters (?v2 ?v4 ?v7 ?v5)
:precondition (and (pred_6 ?v2) (pred_6 ?v4) (pred_1 ?v7) (pred_5 ?v5)
          (pred_9 ?v2 ?v4) (pred_8 ?v7 ?v5)
                   (pred_2 ?v4 ?v5) (pred_10 ?v2) 
                   (pred_12 ?v4) (pred_4 ?v7))
:effect (and  (pred_7 ?v4) (not (pred_12 ?v4))))


(:action op_5
:parameters (?v2 ?v10)
:precondition (and (pred_6 ?v2) (pred_6 ?v10)
               (pred_10 ?v2) (pred_9 ?v2 ?v10) (pred_7 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v2))))

(:action op_4
:parameters (?v2 ?v7)
:precondition (and (pred_6 ?v2) (pred_1 ?v7) 
                  (pred_10 ?v2) (pred_11 ?v7 ?v2) (pred_3 ))
:effect (and (pred_4 ?v7)
   (not (pred_11 ?v7 ?v2)) (not (pred_3 ))))


(:action op_3
:parameters (?v2 ?v3 ?v1)
:precondition (and (pred_6 ?v2) (pred_1 ?v3) (pred_1 ?v1)
                  (pred_10 ?v2) (pred_4 ?v1) (pred_11 ?v3 ?v2))
:effect (and (pred_4 ?v3) (pred_11 ?v1 ?v2)
        (not (pred_4 ?v1)) (not (pred_11 ?v3 ?v2))))

(:action op_1
:parameters (?v2 ?v7)
:precondition (and (pred_6 ?v2) (pred_1 ?v7) 
                  (pred_10 ?v2) (pred_4 ?v7))
:effect (and (pred_3 ) (pred_11 ?v7 ?v2) (not (pred_4 ?v7)))))


	
