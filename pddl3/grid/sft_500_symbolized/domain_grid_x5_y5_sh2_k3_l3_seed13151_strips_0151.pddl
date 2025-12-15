(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v13 ?v7)
             (pred_11 ?v8 ?v2)
             (pred_5 ?v13 ?v2)
             (pred_10 ?v11 ?v13 )
	     (pred_9 ?v13)
             (pred_8 ?v9)
             (pred_1 ?v8)
             (pred_7 ?v2)
             (pred_6 ?v13)
             (pred_4 ?v8)
             (pred_12 ?v13)
             (pred_2 ))



(:action op_1
:parameters (?v10 ?v4 ?v1 ?v12)
:precondition (and (pred_8 ?v10) (pred_8 ?v4) (pred_1 ?v1) (pred_7 ?v12)
          (pred_3 ?v10 ?v4) (pred_11 ?v1 ?v12)
                   (pred_5 ?v4 ?v12) (pred_9 ?v10) 
                   (pred_6 ?v4) (pred_4 ?v1))
:effect (and  (pred_12 ?v4) (not (pred_6 ?v4))))


(:action op_2
:parameters (?v10 ?v3)
:precondition (and (pred_8 ?v10) (pred_8 ?v3)
               (pred_9 ?v10) (pred_3 ?v10 ?v3) (pred_12 ?v3))
:effect (and (pred_9 ?v3) (not (pred_9 ?v10))))

(:action op_3
:parameters (?v10 ?v1)
:precondition (and (pred_8 ?v10) (pred_1 ?v1) 
                  (pred_9 ?v10) (pred_10 ?v1 ?v10) (pred_2 ))
:effect (and (pred_4 ?v1)
   (not (pred_10 ?v1 ?v10)) (not (pred_2 ))))


(:action op_4
:parameters (?v10 ?v6 ?v5)
:precondition (and (pred_8 ?v10) (pred_1 ?v6) (pred_1 ?v5)
                  (pred_9 ?v10) (pred_4 ?v5) (pred_10 ?v6 ?v10))
:effect (and (pred_4 ?v6) (pred_10 ?v5 ?v10)
        (not (pred_4 ?v5)) (not (pred_10 ?v6 ?v10))))

(:action op_5
:parameters (?v10 ?v1)
:precondition (and (pred_8 ?v10) (pred_1 ?v1) 
                  (pred_9 ?v10) (pred_4 ?v1))
:effect (and (pred_2 ) (pred_10 ?v1 ?v10) (not (pred_4 ?v1)))))


	
