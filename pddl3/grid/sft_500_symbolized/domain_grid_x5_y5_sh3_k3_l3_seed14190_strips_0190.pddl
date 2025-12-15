(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v13 ?v6)
             (pred_3 ?v3 ?v12)
             (pred_9 ?v13 ?v12)
             (pred_11 ?v2 ?v13 )
	     (pred_6 ?v13)
             (pred_12 ?v7)
             (pred_10 ?v3)
             (pred_4 ?v12)
             (pred_7 ?v13)
             (pred_5 ?v3)
             (pred_2 ?v13)
             (pred_8 ))



(:action op_1
:parameters (?v1 ?v5 ?v10 ?v8)
:precondition (and (pred_12 ?v1) (pred_12 ?v5) (pred_10 ?v10) (pred_4 ?v8)
          (pred_1 ?v1 ?v5) (pred_3 ?v10 ?v8)
                   (pred_9 ?v5 ?v8) (pred_6 ?v1) 
                   (pred_7 ?v5) (pred_5 ?v10))
:effect (and  (pred_2 ?v5) (not (pred_7 ?v5))))


(:action op_5
:parameters (?v1 ?v11)
:precondition (and (pred_12 ?v1) (pred_12 ?v11)
               (pred_6 ?v1) (pred_1 ?v1 ?v11) (pred_2 ?v11))
:effect (and (pred_6 ?v11) (not (pred_6 ?v1))))

(:action op_2
:parameters (?v1 ?v10)
:precondition (and (pred_12 ?v1) (pred_10 ?v10) 
                  (pred_6 ?v1) (pred_11 ?v10 ?v1) (pred_8 ))
:effect (and (pred_5 ?v10)
   (not (pred_11 ?v10 ?v1)) (not (pred_8 ))))


(:action op_3
:parameters (?v1 ?v4 ?v9)
:precondition (and (pred_12 ?v1) (pred_10 ?v4) (pred_10 ?v9)
                  (pred_6 ?v1) (pred_5 ?v9) (pred_11 ?v4 ?v1))
:effect (and (pred_5 ?v4) (pred_11 ?v9 ?v1)
        (not (pred_5 ?v9)) (not (pred_11 ?v4 ?v1))))

(:action op_4
:parameters (?v1 ?v10)
:precondition (and (pred_12 ?v1) (pred_10 ?v10) 
                  (pred_6 ?v1) (pred_5 ?v10))
:effect (and (pred_8 ) (pred_11 ?v10 ?v1) (not (pred_5 ?v10)))))


	
