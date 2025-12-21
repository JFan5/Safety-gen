(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v7 ?v1)
             (pred_6 ?v8 ?v13)
             (pred_11 ?v7 ?v13)
             (pred_1 ?v6 ?v7 )
	     (pred_8 ?v7)
             (pred_3 ?v10)
             (pred_7 ?v8)
             (pred_2 ?v13)
             (pred_5 ?v7)
             (pred_10 ?v8)
             (pred_4 ?v7)
             (pred_12 ))



(:action op_3
:parameters (?v2 ?v9 ?v3 ?v5)
:precondition (and (pred_3 ?v2) (pred_3 ?v9) (pred_7 ?v3) (pred_2 ?v5)
          (pred_9 ?v2 ?v9) (pred_6 ?v3 ?v5)
                   (pred_11 ?v9 ?v5) (pred_8 ?v2) 
                   (pred_5 ?v9) (pred_10 ?v3))
:effect (and  (pred_4 ?v9) (not (pred_5 ?v9))))


(:action op_1
:parameters (?v2 ?v12)
:precondition (and (pred_3 ?v2) (pred_3 ?v12)
               (pred_8 ?v2) (pred_9 ?v2 ?v12) (pred_4 ?v12))
:effect (and (pred_8 ?v12) (not (pred_8 ?v2))))

(:action op_5
:parameters (?v2 ?v3)
:precondition (and (pred_3 ?v2) (pred_7 ?v3) 
                  (pred_8 ?v2) (pred_1 ?v3 ?v2) (pred_12 ))
:effect (and (pred_10 ?v3)
   (not (pred_1 ?v3 ?v2)) (not (pred_12 ))))


(:action op_4
:parameters (?v2 ?v4 ?v11)
:precondition (and (pred_3 ?v2) (pred_7 ?v4) (pred_7 ?v11)
                  (pred_8 ?v2) (pred_10 ?v11) (pred_1 ?v4 ?v2))
:effect (and (pred_10 ?v4) (pred_1 ?v11 ?v2)
        (not (pred_10 ?v11)) (not (pred_1 ?v4 ?v2))))

(:action op_2
:parameters (?v2 ?v3)
:precondition (and (pred_3 ?v2) (pred_7 ?v3) 
                  (pred_8 ?v2) (pred_10 ?v3))
:effect (and (pred_12 ) (pred_1 ?v3 ?v2) (not (pred_10 ?v3)))))


	
