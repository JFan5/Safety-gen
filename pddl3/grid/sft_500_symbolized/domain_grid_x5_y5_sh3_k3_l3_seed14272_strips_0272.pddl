(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v11 ?v2)
             (pred_11 ?v8 ?v12)
             (pred_9 ?v11 ?v12)
             (pred_12 ?v6 ?v11 )
	     (pred_5 ?v11)
             (pred_6 ?v3)
             (pred_1 ?v8)
             (pred_3 ?v12)
             (pred_4 ?v11)
             (pred_10 ?v8)
             (pred_7 ?v11)
             (pred_8 ))



(:action op_3
:parameters (?v1 ?v5 ?v13 ?v9)
:precondition (and (pred_6 ?v1) (pred_6 ?v5) (pred_1 ?v13) (pred_3 ?v9)
          (pred_2 ?v1 ?v5) (pred_11 ?v13 ?v9)
                   (pred_9 ?v5 ?v9) (pred_5 ?v1) 
                   (pred_4 ?v5) (pred_10 ?v13))
:effect (and  (pred_7 ?v5) (not (pred_4 ?v5))))


(:action op_1
:parameters (?v1 ?v10)
:precondition (and (pred_6 ?v1) (pred_6 ?v10)
               (pred_5 ?v1) (pred_2 ?v1 ?v10) (pred_7 ?v10))
:effect (and (pred_5 ?v10) (not (pred_5 ?v1))))

(:action op_2
:parameters (?v1 ?v13)
:precondition (and (pred_6 ?v1) (pred_1 ?v13) 
                  (pred_5 ?v1) (pred_12 ?v13 ?v1) (pred_8 ))
:effect (and (pred_10 ?v13)
   (not (pred_12 ?v13 ?v1)) (not (pred_8 ))))


(:action op_5
:parameters (?v1 ?v4 ?v7)
:precondition (and (pred_6 ?v1) (pred_1 ?v4) (pred_1 ?v7)
                  (pred_5 ?v1) (pred_10 ?v7) (pred_12 ?v4 ?v1))
:effect (and (pred_10 ?v4) (pred_12 ?v7 ?v1)
        (not (pred_10 ?v7)) (not (pred_12 ?v4 ?v1))))

(:action op_4
:parameters (?v1 ?v13)
:precondition (and (pred_6 ?v1) (pred_1 ?v13) 
                  (pred_5 ?v1) (pred_10 ?v13))
:effect (and (pred_8 ) (pred_12 ?v13 ?v1) (not (pred_10 ?v13)))))


	
