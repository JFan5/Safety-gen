(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v12 ?v6)
             (pred_7 ?v3 ?v1)
             (pred_3 ?v12 ?v1)
             (pred_2 ?v4 ?v12 )
	     (pred_11 ?v12)
             (pred_1 ?v11)
             (pred_5 ?v3)
             (pred_10 ?v1)
             (pred_6 ?v12)
             (pred_8 ?v3)
             (pred_9 ?v12)
             (pred_4 ))



(:action op_2
:parameters (?v2 ?v9 ?v5 ?v7)
:precondition (and (pred_1 ?v2) (pred_1 ?v9) (pred_5 ?v5) (pred_10 ?v7)
          (pred_12 ?v2 ?v9) (pred_7 ?v5 ?v7)
                   (pred_3 ?v9 ?v7) (pred_11 ?v2) 
                   (pred_6 ?v9) (pred_8 ?v5))
:effect (and  (pred_9 ?v9) (not (pred_6 ?v9))))


(:action op_5
:parameters (?v2 ?v13)
:precondition (and (pred_1 ?v2) (pred_1 ?v13)
               (pred_11 ?v2) (pred_12 ?v2 ?v13) (pred_9 ?v13))
:effect (and (pred_11 ?v13) (not (pred_11 ?v2))))

(:action op_3
:parameters (?v2 ?v5)
:precondition (and (pred_1 ?v2) (pred_5 ?v5) 
                  (pred_11 ?v2) (pred_2 ?v5 ?v2) (pred_4 ))
:effect (and (pred_8 ?v5)
   (not (pred_2 ?v5 ?v2)) (not (pred_4 ))))


(:action op_1
:parameters (?v2 ?v8 ?v10)
:precondition (and (pred_1 ?v2) (pred_5 ?v8) (pred_5 ?v10)
                  (pred_11 ?v2) (pred_8 ?v10) (pred_2 ?v8 ?v2))
:effect (and (pred_8 ?v8) (pred_2 ?v10 ?v2)
        (not (pred_8 ?v10)) (not (pred_2 ?v8 ?v2))))

(:action op_4
:parameters (?v2 ?v5)
:precondition (and (pred_1 ?v2) (pred_5 ?v5) 
                  (pred_11 ?v2) (pred_8 ?v5))
:effect (and (pred_4 ) (pred_2 ?v5 ?v2) (not (pred_8 ?v5)))))


	
