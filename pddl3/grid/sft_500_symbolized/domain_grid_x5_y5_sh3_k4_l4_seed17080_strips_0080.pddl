(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v13)
             (pred_1 ?v9 ?v7)
             (pred_12 ?v5 ?v7)
             (pred_10 ?v10 ?v5 )
	     (pred_8 ?v5)
             (pred_3 ?v1)
             (pred_11 ?v9)
             (pred_7 ?v7)
             (pred_5 ?v5)
             (pred_4 ?v9)
             (pred_2 ?v5)
             (pred_9 ))



(:action op_3
:parameters (?v2 ?v4 ?v8 ?v12)
:precondition (and (pred_3 ?v2) (pred_3 ?v4) (pred_11 ?v8) (pred_7 ?v12)
          (pred_6 ?v2 ?v4) (pred_1 ?v8 ?v12)
                   (pred_12 ?v4 ?v12) (pred_8 ?v2) 
                   (pred_5 ?v4) (pred_4 ?v8))
:effect (and  (pred_2 ?v4) (not (pred_5 ?v4))))


(:action op_2
:parameters (?v2 ?v11)
:precondition (and (pred_3 ?v2) (pred_3 ?v11)
               (pred_8 ?v2) (pred_6 ?v2 ?v11) (pred_2 ?v11))
:effect (and (pred_8 ?v11) (not (pred_8 ?v2))))

(:action op_1
:parameters (?v2 ?v8)
:precondition (and (pred_3 ?v2) (pred_11 ?v8) 
                  (pred_8 ?v2) (pred_10 ?v8 ?v2) (pred_9 ))
:effect (and (pred_4 ?v8)
   (not (pred_10 ?v8 ?v2)) (not (pred_9 ))))


(:action op_4
:parameters (?v2 ?v3 ?v6)
:precondition (and (pred_3 ?v2) (pred_11 ?v3) (pred_11 ?v6)
                  (pred_8 ?v2) (pred_4 ?v6) (pred_10 ?v3 ?v2))
:effect (and (pred_4 ?v3) (pred_10 ?v6 ?v2)
        (not (pred_4 ?v6)) (not (pred_10 ?v3 ?v2))))

(:action op_5
:parameters (?v2 ?v8)
:precondition (and (pred_3 ?v2) (pred_11 ?v8) 
                  (pred_8 ?v2) (pred_4 ?v8))
:effect (and (pred_9 ) (pred_10 ?v8 ?v2) (not (pred_4 ?v8)))))


	
