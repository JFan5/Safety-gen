(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v8 ?v7)
             (pred_12 ?v3 ?v12)
             (pred_3 ?v8 ?v12)
             (pred_9 ?v6 ?v8 )
	     (pred_6 ?v8)
             (pred_2 ?v4)
             (pred_11 ?v3)
             (pred_10 ?v12)
             (pred_8 ?v8)
             (pred_5 ?v3)
             (pred_7 ?v8)
             (pred_1 ))



(:action op_4
:parameters (?v2 ?v11 ?v10 ?v5)
:precondition (and (pred_2 ?v2) (pred_2 ?v11) (pred_11 ?v10) (pred_10 ?v5)
          (pred_4 ?v2 ?v11) (pred_12 ?v10 ?v5)
                   (pred_3 ?v11 ?v5) (pred_6 ?v2) 
                   (pred_8 ?v11) (pred_5 ?v10))
:effect (and  (pred_7 ?v11) (not (pred_8 ?v11))))


(:action op_5
:parameters (?v2 ?v13)
:precondition (and (pred_2 ?v2) (pred_2 ?v13)
               (pred_6 ?v2) (pred_4 ?v2 ?v13) (pred_7 ?v13))
:effect (and (pred_6 ?v13) (not (pred_6 ?v2))))

(:action op_3
:parameters (?v2 ?v10)
:precondition (and (pred_2 ?v2) (pred_11 ?v10) 
                  (pred_6 ?v2) (pred_9 ?v10 ?v2) (pred_1 ))
:effect (and (pred_5 ?v10)
   (not (pred_9 ?v10 ?v2)) (not (pred_1 ))))


(:action op_2
:parameters (?v2 ?v9 ?v1)
:precondition (and (pred_2 ?v2) (pred_11 ?v9) (pred_11 ?v1)
                  (pred_6 ?v2) (pred_5 ?v1) (pred_9 ?v9 ?v2))
:effect (and (pred_5 ?v9) (pred_9 ?v1 ?v2)
        (not (pred_5 ?v1)) (not (pred_9 ?v9 ?v2))))

(:action op_1
:parameters (?v2 ?v10)
:precondition (and (pred_2 ?v2) (pred_11 ?v10) 
                  (pred_6 ?v2) (pred_5 ?v10))
:effect (and (pred_1 ) (pred_9 ?v10 ?v2) (not (pred_5 ?v10)))))


	
