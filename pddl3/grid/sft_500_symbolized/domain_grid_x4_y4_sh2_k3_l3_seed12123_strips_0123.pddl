(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v1 ?v2)
             (pred_11 ?v8 ?v11)
             (pred_3 ?v1 ?v11)
             (pred_9 ?v6 ?v1 )
	     (pred_5 ?v1)
             (pred_6 ?v12)
             (pred_10 ?v8)
             (pred_4 ?v11)
             (pred_7 ?v1)
             (pred_12 ?v8)
             (pred_1 ?v1)
             (pred_8 ))



(:action op_1
:parameters (?v4 ?v9 ?v3 ?v10)
:precondition (and (pred_6 ?v4) (pred_6 ?v9) (pred_10 ?v3) (pred_4 ?v10)
          (pred_2 ?v4 ?v9) (pred_11 ?v3 ?v10)
                   (pred_3 ?v9 ?v10) (pred_5 ?v4) 
                   (pred_7 ?v9) (pred_12 ?v3))
:effect (and  (pred_1 ?v9) (not (pred_7 ?v9))))


(:action op_2
:parameters (?v4 ?v5)
:precondition (and (pred_6 ?v4) (pred_6 ?v5)
               (pred_5 ?v4) (pred_2 ?v4 ?v5) (pred_1 ?v5))
:effect (and (pred_5 ?v5) (not (pred_5 ?v4))))

(:action op_5
:parameters (?v4 ?v3)
:precondition (and (pred_6 ?v4) (pred_10 ?v3) 
                  (pred_5 ?v4) (pred_9 ?v3 ?v4) (pred_8 ))
:effect (and (pred_12 ?v3)
   (not (pred_9 ?v3 ?v4)) (not (pred_8 ))))


(:action op_3
:parameters (?v4 ?v13 ?v7)
:precondition (and (pred_6 ?v4) (pred_10 ?v13) (pred_10 ?v7)
                  (pred_5 ?v4) (pred_12 ?v7) (pred_9 ?v13 ?v4))
:effect (and (pred_12 ?v13) (pred_9 ?v7 ?v4)
        (not (pred_12 ?v7)) (not (pred_9 ?v13 ?v4))))

(:action op_4
:parameters (?v4 ?v3)
:precondition (and (pred_6 ?v4) (pred_10 ?v3) 
                  (pred_5 ?v4) (pred_12 ?v3))
:effect (and (pred_8 ) (pred_9 ?v3 ?v4) (not (pred_12 ?v3)))))


	
