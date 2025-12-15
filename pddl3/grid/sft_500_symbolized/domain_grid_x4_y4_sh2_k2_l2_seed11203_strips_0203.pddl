(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v12)
             (pred_1 ?v7 ?v3)
             (pred_12 ?v5 ?v3)
             (pred_6 ?v10 ?v5 )
	     (pred_8 ?v5)
             (pred_3 ?v6)
             (pred_9 ?v7)
             (pred_5 ?v3)
             (pred_7 ?v5)
             (pred_4 ?v7)
             (pred_10 ?v5)
             (pred_2 ))



(:action op_3
:parameters (?v1 ?v4 ?v8 ?v13)
:precondition (and (pred_3 ?v1) (pred_3 ?v4) (pred_9 ?v8) (pred_5 ?v13)
          (pred_11 ?v1 ?v4) (pred_1 ?v8 ?v13)
                   (pred_12 ?v4 ?v13) (pred_8 ?v1) 
                   (pred_7 ?v4) (pred_4 ?v8))
:effect (and  (pred_10 ?v4) (not (pred_7 ?v4))))


(:action op_5
:parameters (?v1 ?v9)
:precondition (and (pred_3 ?v1) (pred_3 ?v9)
               (pred_8 ?v1) (pred_11 ?v1 ?v9) (pred_10 ?v9))
:effect (and (pred_8 ?v9) (not (pred_8 ?v1))))

(:action op_2
:parameters (?v1 ?v8)
:precondition (and (pred_3 ?v1) (pred_9 ?v8) 
                  (pred_8 ?v1) (pred_6 ?v8 ?v1) (pred_2 ))
:effect (and (pred_4 ?v8)
   (not (pred_6 ?v8 ?v1)) (not (pred_2 ))))


(:action op_4
:parameters (?v1 ?v2 ?v11)
:precondition (and (pred_3 ?v1) (pred_9 ?v2) (pred_9 ?v11)
                  (pred_8 ?v1) (pred_4 ?v11) (pred_6 ?v2 ?v1))
:effect (and (pred_4 ?v2) (pred_6 ?v11 ?v1)
        (not (pred_4 ?v11)) (not (pred_6 ?v2 ?v1))))

(:action op_1
:parameters (?v1 ?v8)
:precondition (and (pred_3 ?v1) (pred_9 ?v8) 
                  (pred_8 ?v1) (pred_4 ?v8))
:effect (and (pred_2 ) (pred_6 ?v8 ?v1) (not (pred_4 ?v8)))))


	
