(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v11 ?v10)
             (pred_11 ?v4 ?v12)
             (pred_8 ?v11 ?v12)
             (pred_6 ?v9 ?v11 )
	     (pred_12 ?v11)
             (pred_9 ?v6)
             (pred_7 ?v4)
             (pred_3 ?v12)
             (pred_4 ?v11)
             (pred_1 ?v4)
             (pred_5 ?v11)
             (pred_10 ))



(:action op_5
:parameters (?v1 ?v2 ?v7 ?v5)
:precondition (and (pred_9 ?v1) (pred_9 ?v2) (pred_7 ?v7) (pred_3 ?v5)
          (pred_2 ?v1 ?v2) (pred_11 ?v7 ?v5)
                   (pred_8 ?v2 ?v5) (pred_12 ?v1) 
                   (pred_4 ?v2) (pred_1 ?v7))
:effect (and  (pred_5 ?v2) (not (pred_4 ?v2))))


(:action op_3
:parameters (?v1 ?v3)
:precondition (and (pred_9 ?v1) (pred_9 ?v3)
               (pred_12 ?v1) (pred_2 ?v1 ?v3) (pred_5 ?v3))
:effect (and (pred_12 ?v3) (not (pred_12 ?v1))))

(:action op_2
:parameters (?v1 ?v7)
:precondition (and (pred_9 ?v1) (pred_7 ?v7) 
                  (pred_12 ?v1) (pred_6 ?v7 ?v1) (pred_10 ))
:effect (and (pred_1 ?v7)
   (not (pred_6 ?v7 ?v1)) (not (pred_10 ))))


(:action op_1
:parameters (?v1 ?v8 ?v13)
:precondition (and (pred_9 ?v1) (pred_7 ?v8) (pred_7 ?v13)
                  (pred_12 ?v1) (pred_1 ?v13) (pred_6 ?v8 ?v1))
:effect (and (pred_1 ?v8) (pred_6 ?v13 ?v1)
        (not (pred_1 ?v13)) (not (pred_6 ?v8 ?v1))))

(:action op_4
:parameters (?v1 ?v7)
:precondition (and (pred_9 ?v1) (pred_7 ?v7) 
                  (pred_12 ?v1) (pred_1 ?v7))
:effect (and (pred_10 ) (pred_6 ?v7 ?v1) (not (pred_1 ?v7)))))


	
