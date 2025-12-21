(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v3 ?v12)
             (pred_5 ?v13 ?v10)
             (pred_3 ?v3 ?v10)
             (pred_8 ?v11 ?v3 )
	     (pred_7 ?v3)
             (pred_9 ?v9)
             (pred_1 ?v13)
             (pred_11 ?v10)
             (pred_12 ?v3)
             (pred_6 ?v13)
             (pred_10 ?v3)
             (pred_2 ))



(:action op_2
:parameters (?v2 ?v1 ?v5 ?v8)
:precondition (and (pred_9 ?v2) (pred_9 ?v1) (pred_1 ?v5) (pred_11 ?v8)
          (pred_4 ?v2 ?v1) (pred_5 ?v5 ?v8)
                   (pred_3 ?v1 ?v8) (pred_7 ?v2) 
                   (pred_12 ?v1) (pred_6 ?v5))
:effect (and  (pred_10 ?v1) (not (pred_12 ?v1))))


(:action op_4
:parameters (?v2 ?v4)
:precondition (and (pred_9 ?v2) (pred_9 ?v4)
               (pred_7 ?v2) (pred_4 ?v2 ?v4) (pred_10 ?v4))
:effect (and (pred_7 ?v4) (not (pred_7 ?v2))))

(:action op_3
:parameters (?v2 ?v5)
:precondition (and (pred_9 ?v2) (pred_1 ?v5) 
                  (pred_7 ?v2) (pred_8 ?v5 ?v2) (pred_2 ))
:effect (and (pred_6 ?v5)
   (not (pred_8 ?v5 ?v2)) (not (pred_2 ))))


(:action op_1
:parameters (?v2 ?v7 ?v6)
:precondition (and (pred_9 ?v2) (pred_1 ?v7) (pred_1 ?v6)
                  (pred_7 ?v2) (pred_6 ?v6) (pred_8 ?v7 ?v2))
:effect (and (pred_6 ?v7) (pred_8 ?v6 ?v2)
        (not (pred_6 ?v6)) (not (pred_8 ?v7 ?v2))))

(:action op_5
:parameters (?v2 ?v5)
:precondition (and (pred_9 ?v2) (pred_1 ?v5) 
                  (pred_7 ?v2) (pred_6 ?v5))
:effect (and (pred_2 ) (pred_8 ?v5 ?v2) (not (pred_6 ?v5)))))


	
