(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v1 ?v6)
             (pred_7 ?v5 ?v9)
             (pred_3 ?v1 ?v9)
             (pred_6 ?v3 ?v1 )
	     (pred_8 ?v1)
             (pred_9 ?v7)
             (pred_2 ?v5)
             (pred_5 ?v9)
             (pred_10 ?v1)
             (pred_11 ?v5)
             (pred_4 ?v1)
             (pred_12 ))



(:action op_1
:parameters (?v2 ?v10 ?v11 ?v13)
:precondition (and (pred_9 ?v2) (pred_9 ?v10) (pred_2 ?v11) (pred_5 ?v13)
          (pred_1 ?v2 ?v10) (pred_7 ?v11 ?v13)
                   (pred_3 ?v10 ?v13) (pred_8 ?v2) 
                   (pred_10 ?v10) (pred_11 ?v11))
:effect (and  (pred_4 ?v10) (not (pred_10 ?v10))))


(:action op_2
:parameters (?v2 ?v8)
:precondition (and (pred_9 ?v2) (pred_9 ?v8)
               (pred_8 ?v2) (pred_1 ?v2 ?v8) (pred_4 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v2))))

(:action op_5
:parameters (?v2 ?v11)
:precondition (and (pred_9 ?v2) (pred_2 ?v11) 
                  (pred_8 ?v2) (pred_6 ?v11 ?v2) (pred_12 ))
:effect (and (pred_11 ?v11)
   (not (pred_6 ?v11 ?v2)) (not (pred_12 ))))


(:action op_4
:parameters (?v2 ?v12 ?v4)
:precondition (and (pred_9 ?v2) (pred_2 ?v12) (pred_2 ?v4)
                  (pred_8 ?v2) (pred_11 ?v4) (pred_6 ?v12 ?v2))
:effect (and (pred_11 ?v12) (pred_6 ?v4 ?v2)
        (not (pred_11 ?v4)) (not (pred_6 ?v12 ?v2))))

(:action op_3
:parameters (?v2 ?v11)
:precondition (and (pred_9 ?v2) (pred_2 ?v11) 
                  (pred_8 ?v2) (pred_11 ?v11))
:effect (and (pred_12 ) (pred_6 ?v11 ?v2) (not (pred_11 ?v11)))))


	
