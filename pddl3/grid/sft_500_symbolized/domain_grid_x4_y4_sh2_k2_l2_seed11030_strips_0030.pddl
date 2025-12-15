(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v13 ?v11)
             (pred_11 ?v8 ?v7)
             (pred_6 ?v13 ?v7)
             (pred_9 ?v6 ?v13 )
	     (pred_7 ?v13)
             (pred_5 ?v9)
             (pred_2 ?v8)
             (pred_3 ?v7)
             (pred_1 ?v13)
             (pred_8 ?v8)
             (pred_12 ?v13)
             (pred_4 ))



(:action op_3
:parameters (?v10 ?v3 ?v12 ?v2)
:precondition (and (pred_5 ?v10) (pred_5 ?v3) (pred_2 ?v12) (pred_3 ?v2)
          (pred_10 ?v10 ?v3) (pred_11 ?v12 ?v2)
                   (pred_6 ?v3 ?v2) (pred_7 ?v10) 
                   (pred_1 ?v3) (pred_8 ?v12))
:effect (and  (pred_12 ?v3) (not (pred_1 ?v3))))


(:action op_4
:parameters (?v10 ?v1)
:precondition (and (pred_5 ?v10) (pred_5 ?v1)
               (pred_7 ?v10) (pred_10 ?v10 ?v1) (pred_12 ?v1))
:effect (and (pred_7 ?v1) (not (pred_7 ?v10))))

(:action op_1
:parameters (?v10 ?v12)
:precondition (and (pred_5 ?v10) (pred_2 ?v12) 
                  (pred_7 ?v10) (pred_9 ?v12 ?v10) (pred_4 ))
:effect (and (pred_8 ?v12)
   (not (pred_9 ?v12 ?v10)) (not (pred_4 ))))


(:action op_2
:parameters (?v10 ?v5 ?v4)
:precondition (and (pred_5 ?v10) (pred_2 ?v5) (pred_2 ?v4)
                  (pred_7 ?v10) (pred_8 ?v4) (pred_9 ?v5 ?v10))
:effect (and (pred_8 ?v5) (pred_9 ?v4 ?v10)
        (not (pred_8 ?v4)) (not (pred_9 ?v5 ?v10))))

(:action op_5
:parameters (?v10 ?v12)
:precondition (and (pred_5 ?v10) (pred_2 ?v12) 
                  (pred_7 ?v10) (pred_8 ?v12))
:effect (and (pred_4 ) (pred_9 ?v12 ?v10) (not (pred_8 ?v12)))))


	
