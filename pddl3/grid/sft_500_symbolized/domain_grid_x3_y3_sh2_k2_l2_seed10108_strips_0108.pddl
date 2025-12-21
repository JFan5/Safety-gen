(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v7 ?v11)
             (pred_1 ?v6 ?v3)
             (pred_9 ?v7 ?v3)
             (pred_8 ?v4 ?v7 )
	     (pred_2 ?v7)
             (pred_12 ?v8)
             (pred_10 ?v6)
             (pred_5 ?v3)
             (pred_3 ?v7)
             (pred_7 ?v6)
             (pred_11 ?v7)
             (pred_6 ))



(:action op_3
:parameters (?v1 ?v12 ?v2 ?v13)
:precondition (and (pred_12 ?v1) (pred_12 ?v12) (pred_10 ?v2) (pred_5 ?v13)
          (pred_4 ?v1 ?v12) (pred_1 ?v2 ?v13)
                   (pred_9 ?v12 ?v13) (pred_2 ?v1) 
                   (pred_3 ?v12) (pred_7 ?v2))
:effect (and  (pred_11 ?v12) (not (pred_3 ?v12))))


(:action op_1
:parameters (?v1 ?v5)
:precondition (and (pred_12 ?v1) (pred_12 ?v5)
               (pred_2 ?v1) (pred_4 ?v1 ?v5) (pred_11 ?v5))
:effect (and (pred_2 ?v5) (not (pred_2 ?v1))))

(:action op_2
:parameters (?v1 ?v2)
:precondition (and (pred_12 ?v1) (pred_10 ?v2) 
                  (pred_2 ?v1) (pred_8 ?v2 ?v1) (pred_6 ))
:effect (and (pred_7 ?v2)
   (not (pred_8 ?v2 ?v1)) (not (pred_6 ))))


(:action op_5
:parameters (?v1 ?v9 ?v10)
:precondition (and (pred_12 ?v1) (pred_10 ?v9) (pred_10 ?v10)
                  (pred_2 ?v1) (pred_7 ?v10) (pred_8 ?v9 ?v1))
:effect (and (pred_7 ?v9) (pred_8 ?v10 ?v1)
        (not (pred_7 ?v10)) (not (pred_8 ?v9 ?v1))))

(:action op_4
:parameters (?v1 ?v2)
:precondition (and (pred_12 ?v1) (pred_10 ?v2) 
                  (pred_2 ?v1) (pred_7 ?v2))
:effect (and (pred_6 ) (pred_8 ?v2 ?v1) (not (pred_7 ?v2)))))


	
