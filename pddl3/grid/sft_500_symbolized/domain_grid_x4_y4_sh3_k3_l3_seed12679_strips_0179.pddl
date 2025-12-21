(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v7)
             (pred_7 ?v1 ?v3)
             (pred_1 ?v9 ?v3)
             (pred_5 ?v11 ?v9 )
	     (pred_11 ?v9)
             (pred_3 ?v12)
             (pred_8 ?v1)
             (pred_12 ?v3)
             (pred_2 ?v9)
             (pred_4 ?v1)
             (pred_9 ?v9)
             (pred_6 ))



(:action op_5
:parameters (?v4 ?v2 ?v5 ?v6)
:precondition (and (pred_3 ?v4) (pred_3 ?v2) (pred_8 ?v5) (pred_12 ?v6)
          (pred_10 ?v4 ?v2) (pred_7 ?v5 ?v6)
                   (pred_1 ?v2 ?v6) (pred_11 ?v4) 
                   (pred_2 ?v2) (pred_4 ?v5))
:effect (and  (pred_9 ?v2) (not (pred_2 ?v2))))


(:action op_3
:parameters (?v4 ?v10)
:precondition (and (pred_3 ?v4) (pred_3 ?v10)
               (pred_11 ?v4) (pred_10 ?v4 ?v10) (pred_9 ?v10))
:effect (and (pred_11 ?v10) (not (pred_11 ?v4))))

(:action op_2
:parameters (?v4 ?v5)
:precondition (and (pred_3 ?v4) (pred_8 ?v5) 
                  (pred_11 ?v4) (pred_5 ?v5 ?v4) (pred_6 ))
:effect (and (pred_4 ?v5)
   (not (pred_5 ?v5 ?v4)) (not (pred_6 ))))


(:action op_4
:parameters (?v4 ?v8 ?v13)
:precondition (and (pred_3 ?v4) (pred_8 ?v8) (pred_8 ?v13)
                  (pred_11 ?v4) (pred_4 ?v13) (pred_5 ?v8 ?v4))
:effect (and (pred_4 ?v8) (pred_5 ?v13 ?v4)
        (not (pred_4 ?v13)) (not (pred_5 ?v8 ?v4))))

(:action op_1
:parameters (?v4 ?v5)
:precondition (and (pred_3 ?v4) (pred_8 ?v5) 
                  (pred_11 ?v4) (pred_4 ?v5))
:effect (and (pred_6 ) (pred_5 ?v5 ?v4) (not (pred_4 ?v5)))))


	
