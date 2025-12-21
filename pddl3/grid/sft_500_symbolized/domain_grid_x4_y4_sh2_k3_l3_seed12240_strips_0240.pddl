(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v11 ?v1)
             (pred_12 ?v13 ?v10)
             (pred_9 ?v11 ?v10)
             (pred_11 ?v5 ?v11 )
	     (pred_8 ?v11)
             (pred_7 ?v3)
             (pred_2 ?v13)
             (pred_4 ?v10)
             (pred_3 ?v11)
             (pred_5 ?v13)
             (pred_1 ?v11)
             (pred_10 ))



(:action op_4
:parameters (?v2 ?v6 ?v12 ?v4)
:precondition (and (pred_7 ?v2) (pred_7 ?v6) (pred_2 ?v12) (pred_4 ?v4)
          (pred_6 ?v2 ?v6) (pred_12 ?v12 ?v4)
                   (pred_9 ?v6 ?v4) (pred_8 ?v2) 
                   (pred_3 ?v6) (pred_5 ?v12))
:effect (and  (pred_1 ?v6) (not (pred_3 ?v6))))


(:action op_3
:parameters (?v2 ?v8)
:precondition (and (pred_7 ?v2) (pred_7 ?v8)
               (pred_8 ?v2) (pred_6 ?v2 ?v8) (pred_1 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v2))))

(:action op_1
:parameters (?v2 ?v12)
:precondition (and (pred_7 ?v2) (pred_2 ?v12) 
                  (pred_8 ?v2) (pred_11 ?v12 ?v2) (pred_10 ))
:effect (and (pred_5 ?v12)
   (not (pred_11 ?v12 ?v2)) (not (pred_10 ))))


(:action op_2
:parameters (?v2 ?v9 ?v7)
:precondition (and (pred_7 ?v2) (pred_2 ?v9) (pred_2 ?v7)
                  (pred_8 ?v2) (pred_5 ?v7) (pred_11 ?v9 ?v2))
:effect (and (pred_5 ?v9) (pred_11 ?v7 ?v2)
        (not (pred_5 ?v7)) (not (pred_11 ?v9 ?v2))))

(:action op_5
:parameters (?v2 ?v12)
:precondition (and (pred_7 ?v2) (pred_2 ?v12) 
                  (pred_8 ?v2) (pred_5 ?v12))
:effect (and (pred_10 ) (pred_11 ?v12 ?v2) (not (pred_5 ?v12)))))


	
