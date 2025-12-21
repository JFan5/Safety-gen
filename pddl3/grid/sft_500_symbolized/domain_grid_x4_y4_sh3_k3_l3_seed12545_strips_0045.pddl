(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v13 ?v9)
             (pred_8 ?v8 ?v4)
             (pred_5 ?v13 ?v4)
             (pred_9 ?v12 ?v13 )
	     (pred_6 ?v13)
             (pred_2 ?v7)
             (pred_11 ?v8)
             (pred_12 ?v4)
             (pred_10 ?v13)
             (pred_1 ?v8)
             (pred_3 ?v13)
             (pred_4 ))



(:action op_1
:parameters (?v2 ?v1 ?v3 ?v6)
:precondition (and (pred_2 ?v2) (pred_2 ?v1) (pred_11 ?v3) (pred_12 ?v6)
          (pred_7 ?v2 ?v1) (pred_8 ?v3 ?v6)
                   (pred_5 ?v1 ?v6) (pred_6 ?v2) 
                   (pred_10 ?v1) (pred_1 ?v3))
:effect (and  (pred_3 ?v1) (not (pred_10 ?v1))))


(:action op_3
:parameters (?v2 ?v10)
:precondition (and (pred_2 ?v2) (pred_2 ?v10)
               (pred_6 ?v2) (pred_7 ?v2 ?v10) (pred_3 ?v10))
:effect (and (pred_6 ?v10) (not (pred_6 ?v2))))

(:action op_5
:parameters (?v2 ?v3)
:precondition (and (pred_2 ?v2) (pred_11 ?v3) 
                  (pred_6 ?v2) (pred_9 ?v3 ?v2) (pred_4 ))
:effect (and (pred_1 ?v3)
   (not (pred_9 ?v3 ?v2)) (not (pred_4 ))))


(:action op_4
:parameters (?v2 ?v11 ?v5)
:precondition (and (pred_2 ?v2) (pred_11 ?v11) (pred_11 ?v5)
                  (pred_6 ?v2) (pred_1 ?v5) (pred_9 ?v11 ?v2))
:effect (and (pred_1 ?v11) (pred_9 ?v5 ?v2)
        (not (pred_1 ?v5)) (not (pred_9 ?v11 ?v2))))

(:action op_2
:parameters (?v2 ?v3)
:precondition (and (pred_2 ?v2) (pred_11 ?v3) 
                  (pred_6 ?v2) (pred_1 ?v3))
:effect (and (pred_4 ) (pred_9 ?v3 ?v2) (not (pred_1 ?v3)))))


	
