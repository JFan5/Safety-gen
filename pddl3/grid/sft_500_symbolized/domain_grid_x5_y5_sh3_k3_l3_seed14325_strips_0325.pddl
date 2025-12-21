(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v4 ?v5)
             (pred_6 ?v13 ?v10)
             (pred_1 ?v4 ?v10)
             (pred_9 ?v9 ?v4 )
	     (pred_2 ?v4)
             (pred_11 ?v8)
             (pred_12 ?v13)
             (pred_4 ?v10)
             (pred_3 ?v4)
             (pred_7 ?v13)
             (pred_10 ?v4)
             (pred_5 ))



(:action op_1
:parameters (?v2 ?v12 ?v6 ?v11)
:precondition (and (pred_11 ?v2) (pred_11 ?v12) (pred_12 ?v6) (pred_4 ?v11)
          (pred_8 ?v2 ?v12) (pred_6 ?v6 ?v11)
                   (pred_1 ?v12 ?v11) (pred_2 ?v2) 
                   (pred_3 ?v12) (pred_7 ?v6))
:effect (and  (pred_10 ?v12) (not (pred_3 ?v12))))


(:action op_4
:parameters (?v2 ?v3)
:precondition (and (pred_11 ?v2) (pred_11 ?v3)
               (pred_2 ?v2) (pred_8 ?v2 ?v3) (pred_10 ?v3))
:effect (and (pred_2 ?v3) (not (pred_2 ?v2))))

(:action op_5
:parameters (?v2 ?v6)
:precondition (and (pred_11 ?v2) (pred_12 ?v6) 
                  (pred_2 ?v2) (pred_9 ?v6 ?v2) (pred_5 ))
:effect (and (pred_7 ?v6)
   (not (pred_9 ?v6 ?v2)) (not (pred_5 ))))


(:action op_2
:parameters (?v2 ?v1 ?v7)
:precondition (and (pred_11 ?v2) (pred_12 ?v1) (pred_12 ?v7)
                  (pred_2 ?v2) (pred_7 ?v7) (pred_9 ?v1 ?v2))
:effect (and (pred_7 ?v1) (pred_9 ?v7 ?v2)
        (not (pred_7 ?v7)) (not (pred_9 ?v1 ?v2))))

(:action op_3
:parameters (?v2 ?v6)
:precondition (and (pred_11 ?v2) (pred_12 ?v6) 
                  (pred_2 ?v2) (pred_7 ?v6))
:effect (and (pred_5 ) (pred_9 ?v6 ?v2) (not (pred_7 ?v6)))))


	
