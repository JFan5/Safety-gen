(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v5 ?v13)
             (pred_10 ?v6 ?v10)
             (pred_3 ?v5 ?v10)
             (pred_2 ?v9 ?v5 )
	     (pred_9 ?v5)
             (pred_1 ?v8)
             (pred_5 ?v6)
             (pred_11 ?v10)
             (pred_7 ?v5)
             (pred_8 ?v6)
             (pred_6 ?v5)
             (pred_12 ))



(:action op_4
:parameters (?v2 ?v4 ?v12 ?v1)
:precondition (and (pred_1 ?v2) (pred_1 ?v4) (pred_5 ?v12) (pred_11 ?v1)
          (pred_4 ?v2 ?v4) (pred_10 ?v12 ?v1)
                   (pred_3 ?v4 ?v1) (pred_9 ?v2) 
                   (pred_7 ?v4) (pred_8 ?v12))
:effect (and  (pred_6 ?v4) (not (pred_7 ?v4))))


(:action op_3
:parameters (?v2 ?v7)
:precondition (and (pred_1 ?v2) (pred_1 ?v7)
               (pred_9 ?v2) (pred_4 ?v2 ?v7) (pred_6 ?v7))
:effect (and (pred_9 ?v7) (not (pred_9 ?v2))))

(:action op_1
:parameters (?v2 ?v12)
:precondition (and (pred_1 ?v2) (pred_5 ?v12) 
                  (pred_9 ?v2) (pred_2 ?v12 ?v2) (pred_12 ))
:effect (and (pred_8 ?v12)
   (not (pred_2 ?v12 ?v2)) (not (pred_12 ))))


(:action op_2
:parameters (?v2 ?v11 ?v3)
:precondition (and (pred_1 ?v2) (pred_5 ?v11) (pred_5 ?v3)
                  (pred_9 ?v2) (pred_8 ?v3) (pred_2 ?v11 ?v2))
:effect (and (pred_8 ?v11) (pred_2 ?v3 ?v2)
        (not (pred_8 ?v3)) (not (pred_2 ?v11 ?v2))))

(:action op_5
:parameters (?v2 ?v12)
:precondition (and (pred_1 ?v2) (pred_5 ?v12) 
                  (pred_9 ?v2) (pred_8 ?v12))
:effect (and (pred_12 ) (pred_2 ?v12 ?v2) (not (pred_8 ?v12)))))


	
