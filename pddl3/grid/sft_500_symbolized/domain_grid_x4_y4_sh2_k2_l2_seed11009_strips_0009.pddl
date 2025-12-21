(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v7 ?v9)
             (pred_8 ?v12 ?v8)
             (pred_11 ?v7 ?v8)
             (pred_9 ?v6 ?v7 )
	     (pred_10 ?v7)
             (pred_1 ?v13)
             (pred_12 ?v12)
             (pred_3 ?v8)
             (pred_7 ?v7)
             (pred_2 ?v12)
             (pred_4 ?v7)
             (pred_6 ))



(:action op_5
:parameters (?v2 ?v10 ?v3 ?v4)
:precondition (and (pred_1 ?v2) (pred_1 ?v10) (pred_12 ?v3) (pred_3 ?v4)
          (pred_5 ?v2 ?v10) (pred_8 ?v3 ?v4)
                   (pred_11 ?v10 ?v4) (pred_10 ?v2) 
                   (pred_7 ?v10) (pred_2 ?v3))
:effect (and  (pred_4 ?v10) (not (pred_7 ?v10))))


(:action op_4
:parameters (?v2 ?v5)
:precondition (and (pred_1 ?v2) (pred_1 ?v5)
               (pred_10 ?v2) (pred_5 ?v2 ?v5) (pred_4 ?v5))
:effect (and (pred_10 ?v5) (not (pred_10 ?v2))))

(:action op_1
:parameters (?v2 ?v3)
:precondition (and (pred_1 ?v2) (pred_12 ?v3) 
                  (pred_10 ?v2) (pred_9 ?v3 ?v2) (pred_6 ))
:effect (and (pred_2 ?v3)
   (not (pred_9 ?v3 ?v2)) (not (pred_6 ))))


(:action op_2
:parameters (?v2 ?v11 ?v1)
:precondition (and (pred_1 ?v2) (pred_12 ?v11) (pred_12 ?v1)
                  (pred_10 ?v2) (pred_2 ?v1) (pred_9 ?v11 ?v2))
:effect (and (pred_2 ?v11) (pred_9 ?v1 ?v2)
        (not (pred_2 ?v1)) (not (pred_9 ?v11 ?v2))))

(:action op_3
:parameters (?v2 ?v3)
:precondition (and (pred_1 ?v2) (pred_12 ?v3) 
                  (pred_10 ?v2) (pred_2 ?v3))
:effect (and (pred_6 ) (pred_9 ?v3 ?v2) (not (pred_2 ?v3)))))


	
