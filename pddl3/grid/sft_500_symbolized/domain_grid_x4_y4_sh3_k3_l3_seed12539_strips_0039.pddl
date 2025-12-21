(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v13 ?v11)
             (pred_11 ?v3 ?v9)
             (pred_10 ?v13 ?v9)
             (pred_12 ?v5 ?v13 )
	     (pred_8 ?v13)
             (pred_4 ?v7)
             (pred_3 ?v3)
             (pred_6 ?v9)
             (pred_9 ?v13)
             (pred_1 ?v3)
             (pred_5 ?v13)
             (pred_7 ))



(:action op_3
:parameters (?v1 ?v2 ?v4 ?v10)
:precondition (and (pred_4 ?v1) (pred_4 ?v2) (pred_3 ?v4) (pred_6 ?v10)
          (pred_2 ?v1 ?v2) (pred_11 ?v4 ?v10)
                   (pred_10 ?v2 ?v10) (pred_8 ?v1) 
                   (pred_9 ?v2) (pred_1 ?v4))
:effect (and  (pred_5 ?v2) (not (pred_9 ?v2))))


(:action op_5
:parameters (?v1 ?v8)
:precondition (and (pred_4 ?v1) (pred_4 ?v8)
               (pred_8 ?v1) (pred_2 ?v1 ?v8) (pred_5 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v1))))

(:action op_2
:parameters (?v1 ?v4)
:precondition (and (pred_4 ?v1) (pred_3 ?v4) 
                  (pred_8 ?v1) (pred_12 ?v4 ?v1) (pred_7 ))
:effect (and (pred_1 ?v4)
   (not (pred_12 ?v4 ?v1)) (not (pred_7 ))))


(:action op_1
:parameters (?v1 ?v12 ?v6)
:precondition (and (pred_4 ?v1) (pred_3 ?v12) (pred_3 ?v6)
                  (pred_8 ?v1) (pred_1 ?v6) (pred_12 ?v12 ?v1))
:effect (and (pred_1 ?v12) (pred_12 ?v6 ?v1)
        (not (pred_1 ?v6)) (not (pred_12 ?v12 ?v1))))

(:action op_4
:parameters (?v1 ?v4)
:precondition (and (pred_4 ?v1) (pred_3 ?v4) 
                  (pred_8 ?v1) (pred_1 ?v4))
:effect (and (pred_7 ) (pred_12 ?v4 ?v1) (not (pred_1 ?v4)))))


	
