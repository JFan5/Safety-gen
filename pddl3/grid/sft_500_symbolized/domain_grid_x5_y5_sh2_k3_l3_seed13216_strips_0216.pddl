(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v3 ?v9)
             (pred_6 ?v4 ?v1)
             (pred_1 ?v3 ?v1)
             (pred_5 ?v7 ?v3 )
	     (pred_4 ?v3)
             (pred_8 ?v11)
             (pred_11 ?v4)
             (pred_3 ?v1)
             (pred_12 ?v3)
             (pred_2 ?v4)
             (pred_10 ?v3)
             (pred_9 ))



(:action op_3
:parameters (?v2 ?v8 ?v12 ?v5)
:precondition (and (pred_8 ?v2) (pred_8 ?v8) (pred_11 ?v12) (pred_3 ?v5)
          (pred_7 ?v2 ?v8) (pred_6 ?v12 ?v5)
                   (pred_1 ?v8 ?v5) (pred_4 ?v2) 
                   (pred_12 ?v8) (pred_2 ?v12))
:effect (and  (pred_10 ?v8) (not (pred_12 ?v8))))


(:action op_2
:parameters (?v2 ?v13)
:precondition (and (pred_8 ?v2) (pred_8 ?v13)
               (pred_4 ?v2) (pred_7 ?v2 ?v13) (pred_10 ?v13))
:effect (and (pred_4 ?v13) (not (pred_4 ?v2))))

(:action op_5
:parameters (?v2 ?v12)
:precondition (and (pred_8 ?v2) (pred_11 ?v12) 
                  (pred_4 ?v2) (pred_5 ?v12 ?v2) (pred_9 ))
:effect (and (pred_2 ?v12)
   (not (pred_5 ?v12 ?v2)) (not (pred_9 ))))


(:action op_1
:parameters (?v2 ?v10 ?v6)
:precondition (and (pred_8 ?v2) (pred_11 ?v10) (pred_11 ?v6)
                  (pred_4 ?v2) (pred_2 ?v6) (pred_5 ?v10 ?v2))
:effect (and (pred_2 ?v10) (pred_5 ?v6 ?v2)
        (not (pred_2 ?v6)) (not (pred_5 ?v10 ?v2))))

(:action op_4
:parameters (?v2 ?v12)
:precondition (and (pred_8 ?v2) (pred_11 ?v12) 
                  (pred_4 ?v2) (pred_2 ?v12))
:effect (and (pred_9 ) (pred_5 ?v12 ?v2) (not (pred_2 ?v12)))))


	
