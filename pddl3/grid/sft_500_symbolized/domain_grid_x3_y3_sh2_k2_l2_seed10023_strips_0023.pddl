(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v3 ?v11)
             (pred_10 ?v7 ?v6)
             (pred_4 ?v3 ?v6)
             (pred_11 ?v13 ?v3 )
	     (pred_8 ?v3)
             (pred_2 ?v2)
             (pred_6 ?v7)
             (pred_9 ?v6)
             (pred_3 ?v3)
             (pred_1 ?v7)
             (pred_12 ?v3)
             (pred_5 ))



(:action op_4
:parameters (?v4 ?v1 ?v5 ?v9)
:precondition (and (pred_2 ?v4) (pred_2 ?v1) (pred_6 ?v5) (pred_9 ?v9)
          (pred_7 ?v4 ?v1) (pred_10 ?v5 ?v9)
                   (pred_4 ?v1 ?v9) (pred_8 ?v4) 
                   (pred_3 ?v1) (pred_1 ?v5))
:effect (and  (pred_12 ?v1) (not (pred_3 ?v1))))


(:action op_5
:parameters (?v4 ?v10)
:precondition (and (pred_2 ?v4) (pred_2 ?v10)
               (pred_8 ?v4) (pred_7 ?v4 ?v10) (pred_12 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v4))))

(:action op_3
:parameters (?v4 ?v5)
:precondition (and (pred_2 ?v4) (pred_6 ?v5) 
                  (pred_8 ?v4) (pred_11 ?v5 ?v4) (pred_5 ))
:effect (and (pred_1 ?v5)
   (not (pred_11 ?v5 ?v4)) (not (pred_5 ))))


(:action op_1
:parameters (?v4 ?v8 ?v12)
:precondition (and (pred_2 ?v4) (pred_6 ?v8) (pred_6 ?v12)
                  (pred_8 ?v4) (pred_1 ?v12) (pred_11 ?v8 ?v4))
:effect (and (pred_1 ?v8) (pred_11 ?v12 ?v4)
        (not (pred_1 ?v12)) (not (pred_11 ?v8 ?v4))))

(:action op_2
:parameters (?v4 ?v5)
:precondition (and (pred_2 ?v4) (pred_6 ?v5) 
                  (pred_8 ?v4) (pred_1 ?v5))
:effect (and (pred_5 ) (pred_11 ?v5 ?v4) (not (pred_1 ?v5)))))


	
