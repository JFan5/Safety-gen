(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v9 ?v10)
             (pred_11 ?v7 ?v1)
             (pred_8 ?v9 ?v1)
             (pred_2 ?v13 ?v9 )
	     (pred_9 ?v9)
             (pred_4 ?v11)
             (pred_3 ?v7)
             (pred_1 ?v1)
             (pred_7 ?v9)
             (pred_10 ?v7)
             (pred_12 ?v9)
             (pred_6 ))



(:action op_5
:parameters (?v4 ?v2 ?v12 ?v6)
:precondition (and (pred_4 ?v4) (pred_4 ?v2) (pred_3 ?v12) (pred_1 ?v6)
          (pred_5 ?v4 ?v2) (pred_11 ?v12 ?v6)
                   (pred_8 ?v2 ?v6) (pred_9 ?v4) 
                   (pred_7 ?v2) (pred_10 ?v12))
:effect (and  (pred_12 ?v2) (not (pred_7 ?v2))))


(:action op_4
:parameters (?v4 ?v5)
:precondition (and (pred_4 ?v4) (pred_4 ?v5)
               (pred_9 ?v4) (pred_5 ?v4 ?v5) (pred_12 ?v5))
:effect (and (pred_9 ?v5) (not (pred_9 ?v4))))

(:action op_1
:parameters (?v4 ?v12)
:precondition (and (pred_4 ?v4) (pred_3 ?v12) 
                  (pred_9 ?v4) (pred_2 ?v12 ?v4) (pred_6 ))
:effect (and (pred_10 ?v12)
   (not (pred_2 ?v12 ?v4)) (not (pred_6 ))))


(:action op_2
:parameters (?v4 ?v8 ?v3)
:precondition (and (pred_4 ?v4) (pred_3 ?v8) (pred_3 ?v3)
                  (pred_9 ?v4) (pred_10 ?v3) (pred_2 ?v8 ?v4))
:effect (and (pred_10 ?v8) (pred_2 ?v3 ?v4)
        (not (pred_10 ?v3)) (not (pred_2 ?v8 ?v4))))

(:action op_3
:parameters (?v4 ?v12)
:precondition (and (pred_4 ?v4) (pred_3 ?v12) 
                  (pred_9 ?v4) (pred_10 ?v12))
:effect (and (pred_6 ) (pred_2 ?v12 ?v4) (not (pred_10 ?v12)))))


	
