(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v9 ?v7)
             (pred_4 ?v11 ?v12)
             (pred_5 ?v9 ?v12)
             (pred_9 ?v6 ?v9 )
	     (pred_1 ?v9)
             (pred_6 ?v1)
             (pred_11 ?v11)
             (pred_7 ?v12)
             (pred_10 ?v9)
             (pred_3 ?v11)
             (pred_2 ?v9)
             (pred_8 ))



(:action op_3
:parameters (?v2 ?v5 ?v10 ?v8)
:precondition (and (pred_6 ?v2) (pred_6 ?v5) (pred_11 ?v10) (pred_7 ?v8)
          (pred_12 ?v2 ?v5) (pred_4 ?v10 ?v8)
                   (pred_5 ?v5 ?v8) (pred_1 ?v2) 
                   (pred_10 ?v5) (pred_3 ?v10))
:effect (and  (pred_2 ?v5) (not (pred_10 ?v5))))


(:action op_5
:parameters (?v2 ?v13)
:precondition (and (pred_6 ?v2) (pred_6 ?v13)
               (pred_1 ?v2) (pred_12 ?v2 ?v13) (pred_2 ?v13))
:effect (and (pred_1 ?v13) (not (pred_1 ?v2))))

(:action op_4
:parameters (?v2 ?v10)
:precondition (and (pred_6 ?v2) (pred_11 ?v10) 
                  (pred_1 ?v2) (pred_9 ?v10 ?v2) (pred_8 ))
:effect (and (pred_3 ?v10)
   (not (pred_9 ?v10 ?v2)) (not (pred_8 ))))


(:action op_2
:parameters (?v2 ?v4 ?v3)
:precondition (and (pred_6 ?v2) (pred_11 ?v4) (pred_11 ?v3)
                  (pred_1 ?v2) (pred_3 ?v3) (pred_9 ?v4 ?v2))
:effect (and (pred_3 ?v4) (pred_9 ?v3 ?v2)
        (not (pred_3 ?v3)) (not (pred_9 ?v4 ?v2))))

(:action op_1
:parameters (?v2 ?v10)
:precondition (and (pred_6 ?v2) (pred_11 ?v10) 
                  (pred_1 ?v2) (pred_3 ?v10))
:effect (and (pred_8 ) (pred_9 ?v10 ?v2) (not (pred_3 ?v10)))))


	
