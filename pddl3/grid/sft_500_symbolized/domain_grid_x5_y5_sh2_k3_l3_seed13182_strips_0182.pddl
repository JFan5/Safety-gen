(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v13 ?v3)
             (pred_2 ?v6 ?v8)
             (pred_6 ?v13 ?v8)
             (pred_11 ?v5 ?v13 )
	     (pred_1 ?v13)
             (pred_12 ?v7)
             (pred_5 ?v6)
             (pred_7 ?v8)
             (pred_3 ?v13)
             (pred_9 ?v6)
             (pred_8 ?v13)
             (pred_10 ))



(:action op_1
:parameters (?v1 ?v12 ?v11 ?v2)
:precondition (and (pred_12 ?v1) (pred_12 ?v12) (pred_5 ?v11) (pred_7 ?v2)
          (pred_4 ?v1 ?v12) (pred_2 ?v11 ?v2)
                   (pred_6 ?v12 ?v2) (pred_1 ?v1) 
                   (pred_3 ?v12) (pred_9 ?v11))
:effect (and  (pred_8 ?v12) (not (pred_3 ?v12))))


(:action op_3
:parameters (?v1 ?v10)
:precondition (and (pred_12 ?v1) (pred_12 ?v10)
               (pred_1 ?v1) (pred_4 ?v1 ?v10) (pred_8 ?v10))
:effect (and (pred_1 ?v10) (not (pred_1 ?v1))))

(:action op_5
:parameters (?v1 ?v11)
:precondition (and (pred_12 ?v1) (pred_5 ?v11) 
                  (pred_1 ?v1) (pred_11 ?v11 ?v1) (pred_10 ))
:effect (and (pred_9 ?v11)
   (not (pred_11 ?v11 ?v1)) (not (pred_10 ))))


(:action op_4
:parameters (?v1 ?v4 ?v9)
:precondition (and (pred_12 ?v1) (pred_5 ?v4) (pred_5 ?v9)
                  (pred_1 ?v1) (pred_9 ?v9) (pred_11 ?v4 ?v1))
:effect (and (pred_9 ?v4) (pred_11 ?v9 ?v1)
        (not (pred_9 ?v9)) (not (pred_11 ?v4 ?v1))))

(:action op_2
:parameters (?v1 ?v11)
:precondition (and (pred_12 ?v1) (pred_5 ?v11) 
                  (pred_1 ?v1) (pred_9 ?v11))
:effect (and (pred_10 ) (pred_11 ?v11 ?v1) (not (pred_9 ?v11)))))


	
