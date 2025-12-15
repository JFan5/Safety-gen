(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v8 ?v6)
             (pred_1 ?v12 ?v11)
             (pred_11 ?v8 ?v11)
             (pred_6 ?v13 ?v8 )
	     (pred_9 ?v8)
             (pred_5 ?v7)
             (pred_2 ?v12)
             (pred_4 ?v11)
             (pred_12 ?v8)
             (pred_7 ?v12)
             (pred_3 ?v8)
             (pred_10 ))



(:action op_1
:parameters (?v10 ?v2 ?v1 ?v4)
:precondition (and (pred_5 ?v10) (pred_5 ?v2) (pred_2 ?v1) (pred_4 ?v4)
          (pred_8 ?v10 ?v2) (pred_1 ?v1 ?v4)
                   (pred_11 ?v2 ?v4) (pred_9 ?v10) 
                   (pred_12 ?v2) (pred_7 ?v1))
:effect (and  (pred_3 ?v2) (not (pred_12 ?v2))))


(:action op_2
:parameters (?v10 ?v3)
:precondition (and (pred_5 ?v10) (pred_5 ?v3)
               (pred_9 ?v10) (pred_8 ?v10 ?v3) (pred_3 ?v3))
:effect (and (pred_9 ?v3) (not (pred_9 ?v10))))

(:action op_5
:parameters (?v10 ?v1)
:precondition (and (pred_5 ?v10) (pred_2 ?v1) 
                  (pred_9 ?v10) (pred_6 ?v1 ?v10) (pred_10 ))
:effect (and (pred_7 ?v1)
   (not (pred_6 ?v1 ?v10)) (not (pred_10 ))))


(:action op_4
:parameters (?v10 ?v5 ?v9)
:precondition (and (pred_5 ?v10) (pred_2 ?v5) (pred_2 ?v9)
                  (pred_9 ?v10) (pred_7 ?v9) (pred_6 ?v5 ?v10))
:effect (and (pred_7 ?v5) (pred_6 ?v9 ?v10)
        (not (pred_7 ?v9)) (not (pred_6 ?v5 ?v10))))

(:action op_3
:parameters (?v10 ?v1)
:precondition (and (pred_5 ?v10) (pred_2 ?v1) 
                  (pred_9 ?v10) (pred_7 ?v1))
:effect (and (pred_10 ) (pred_6 ?v1 ?v10) (not (pred_7 ?v1)))))


	
