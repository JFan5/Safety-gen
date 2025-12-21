(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v11 ?v13)
             (pred_2 ?v6 ?v5)
             (pred_11 ?v11 ?v5)
             (pred_5 ?v7 ?v11 )
	     (pred_9 ?v11)
             (pred_1 ?v10)
             (pred_12 ?v6)
             (pred_10 ?v5)
             (pred_7 ?v11)
             (pred_6 ?v6)
             (pred_3 ?v11)
             (pred_8 ))



(:action op_2
:parameters (?v4 ?v9 ?v3 ?v8)
:precondition (and (pred_1 ?v4) (pred_1 ?v9) (pred_12 ?v3) (pred_10 ?v8)
          (pred_4 ?v4 ?v9) (pred_2 ?v3 ?v8)
                   (pred_11 ?v9 ?v8) (pred_9 ?v4) 
                   (pred_7 ?v9) (pred_6 ?v3))
:effect (and  (pred_3 ?v9) (not (pred_7 ?v9))))


(:action op_1
:parameters (?v4 ?v2)
:precondition (and (pred_1 ?v4) (pred_1 ?v2)
               (pred_9 ?v4) (pred_4 ?v4 ?v2) (pred_3 ?v2))
:effect (and (pred_9 ?v2) (not (pred_9 ?v4))))

(:action op_5
:parameters (?v4 ?v3)
:precondition (and (pred_1 ?v4) (pred_12 ?v3) 
                  (pred_9 ?v4) (pred_5 ?v3 ?v4) (pred_8 ))
:effect (and (pred_6 ?v3)
   (not (pred_5 ?v3 ?v4)) (not (pred_8 ))))


(:action op_3
:parameters (?v4 ?v12 ?v1)
:precondition (and (pred_1 ?v4) (pred_12 ?v12) (pred_12 ?v1)
                  (pred_9 ?v4) (pred_6 ?v1) (pred_5 ?v12 ?v4))
:effect (and (pred_6 ?v12) (pred_5 ?v1 ?v4)
        (not (pred_6 ?v1)) (not (pred_5 ?v12 ?v4))))

(:action op_4
:parameters (?v4 ?v3)
:precondition (and (pred_1 ?v4) (pred_12 ?v3) 
                  (pred_9 ?v4) (pred_6 ?v3))
:effect (and (pred_8 ) (pred_5 ?v3 ?v4) (not (pred_6 ?v3)))))


	
