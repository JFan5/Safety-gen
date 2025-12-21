(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v5 ?v11)
             (pred_9 ?v10 ?v7)
             (pred_11 ?v5 ?v7)
             (pred_4 ?v12 ?v5 )
	     (pred_3 ?v5)
             (pred_12 ?v3)
             (pred_5 ?v10)
             (pred_10 ?v7)
             (pred_1 ?v5)
             (pred_7 ?v10)
             (pred_6 ?v5)
             (pred_8 ))



(:action op_5
:parameters (?v4 ?v1 ?v2 ?v6)
:precondition (and (pred_12 ?v4) (pred_12 ?v1) (pred_5 ?v2) (pred_10 ?v6)
          (pred_2 ?v4 ?v1) (pred_9 ?v2 ?v6)
                   (pred_11 ?v1 ?v6) (pred_3 ?v4) 
                   (pred_1 ?v1) (pred_7 ?v2))
:effect (and  (pred_6 ?v1) (not (pred_1 ?v1))))


(:action op_4
:parameters (?v4 ?v13)
:precondition (and (pred_12 ?v4) (pred_12 ?v13)
               (pred_3 ?v4) (pred_2 ?v4 ?v13) (pred_6 ?v13))
:effect (and (pred_3 ?v13) (not (pred_3 ?v4))))

(:action op_1
:parameters (?v4 ?v2)
:precondition (and (pred_12 ?v4) (pred_5 ?v2) 
                  (pred_3 ?v4) (pred_4 ?v2 ?v4) (pred_8 ))
:effect (and (pred_7 ?v2)
   (not (pred_4 ?v2 ?v4)) (not (pred_8 ))))


(:action op_3
:parameters (?v4 ?v8 ?v9)
:precondition (and (pred_12 ?v4) (pred_5 ?v8) (pred_5 ?v9)
                  (pred_3 ?v4) (pred_7 ?v9) (pred_4 ?v8 ?v4))
:effect (and (pred_7 ?v8) (pred_4 ?v9 ?v4)
        (not (pred_7 ?v9)) (not (pred_4 ?v8 ?v4))))

(:action op_2
:parameters (?v4 ?v2)
:precondition (and (pred_12 ?v4) (pred_5 ?v2) 
                  (pred_3 ?v4) (pred_7 ?v2))
:effect (and (pred_8 ) (pred_4 ?v2 ?v4) (not (pred_7 ?v2)))))


	
