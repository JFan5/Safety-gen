(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v3 ?v13)
             (pred_10 ?v12 ?v6)
             (pred_6 ?v3 ?v6)
             (pred_7 ?v5 ?v3 )
	     (pred_11 ?v3)
             (pred_5 ?v9)
             (pred_2 ?v12)
             (pred_8 ?v6)
             (pred_3 ?v3)
             (pred_9 ?v12)
             (pred_4 ?v3)
             (pred_1 ))



(:action op_5
:parameters (?v4 ?v2 ?v1 ?v8)
:precondition (and (pred_5 ?v4) (pred_5 ?v2) (pred_2 ?v1) (pred_8 ?v8)
          (pred_12 ?v4 ?v2) (pred_10 ?v1 ?v8)
                   (pred_6 ?v2 ?v8) (pred_11 ?v4) 
                   (pred_3 ?v2) (pred_9 ?v1))
:effect (and  (pred_4 ?v2) (not (pred_3 ?v2))))


(:action op_3
:parameters (?v4 ?v10)
:precondition (and (pred_5 ?v4) (pred_5 ?v10)
               (pred_11 ?v4) (pred_12 ?v4 ?v10) (pred_4 ?v10))
:effect (and (pred_11 ?v10) (not (pred_11 ?v4))))

(:action op_2
:parameters (?v4 ?v1)
:precondition (and (pred_5 ?v4) (pred_2 ?v1) 
                  (pred_11 ?v4) (pred_7 ?v1 ?v4) (pred_1 ))
:effect (and (pred_9 ?v1)
   (not (pred_7 ?v1 ?v4)) (not (pred_1 ))))


(:action op_1
:parameters (?v4 ?v11 ?v7)
:precondition (and (pred_5 ?v4) (pred_2 ?v11) (pred_2 ?v7)
                  (pred_11 ?v4) (pred_9 ?v7) (pred_7 ?v11 ?v4))
:effect (and (pred_9 ?v11) (pred_7 ?v7 ?v4)
        (not (pred_9 ?v7)) (not (pred_7 ?v11 ?v4))))

(:action op_4
:parameters (?v4 ?v1)
:precondition (and (pred_5 ?v4) (pred_2 ?v1) 
                  (pred_11 ?v4) (pred_9 ?v1))
:effect (and (pred_1 ) (pred_7 ?v1 ?v4) (not (pred_9 ?v1)))))


	
