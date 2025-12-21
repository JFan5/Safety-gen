(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v1 ?v13)
             (pred_12 ?v3 ?v12)
             (pred_4 ?v1 ?v12)
             (pred_3 ?v6 ?v1 )
	     (pred_5 ?v1)
             (pred_11 ?v7)
             (pred_1 ?v3)
             (pred_10 ?v12)
             (pred_9 ?v1)
             (pred_2 ?v3)
             (pred_6 ?v1)
             (pred_7 ))



(:action op_5
:parameters (?v2 ?v9 ?v8 ?v5)
:precondition (and (pred_11 ?v2) (pred_11 ?v9) (pred_1 ?v8) (pred_10 ?v5)
          (pred_8 ?v2 ?v9) (pred_12 ?v8 ?v5)
                   (pred_4 ?v9 ?v5) (pred_5 ?v2) 
                   (pred_9 ?v9) (pred_2 ?v8))
:effect (and  (pred_6 ?v9) (not (pred_9 ?v9))))


(:action op_2
:parameters (?v2 ?v11)
:precondition (and (pred_11 ?v2) (pred_11 ?v11)
               (pred_5 ?v2) (pred_8 ?v2 ?v11) (pred_6 ?v11))
:effect (and (pred_5 ?v11) (not (pred_5 ?v2))))

(:action op_3
:parameters (?v2 ?v8)
:precondition (and (pred_11 ?v2) (pred_1 ?v8) 
                  (pred_5 ?v2) (pred_3 ?v8 ?v2) (pred_7 ))
:effect (and (pred_2 ?v8)
   (not (pred_3 ?v8 ?v2)) (not (pred_7 ))))


(:action op_4
:parameters (?v2 ?v10 ?v4)
:precondition (and (pred_11 ?v2) (pred_1 ?v10) (pred_1 ?v4)
                  (pred_5 ?v2) (pred_2 ?v4) (pred_3 ?v10 ?v2))
:effect (and (pred_2 ?v10) (pred_3 ?v4 ?v2)
        (not (pred_2 ?v4)) (not (pred_3 ?v10 ?v2))))

(:action op_1
:parameters (?v2 ?v8)
:precondition (and (pred_11 ?v2) (pred_1 ?v8) 
                  (pred_5 ?v2) (pred_2 ?v8))
:effect (and (pred_7 ) (pred_3 ?v8 ?v2) (not (pred_2 ?v8)))))


	
