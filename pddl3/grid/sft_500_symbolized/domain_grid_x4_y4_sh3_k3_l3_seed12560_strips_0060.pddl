(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v1 ?v7)
             (pred_9 ?v11 ?v10)
             (pred_3 ?v1 ?v10)
             (pred_10 ?v12 ?v1 )
	     (pred_11 ?v1)
             (pred_6 ?v9)
             (pred_2 ?v11)
             (pred_4 ?v10)
             (pred_12 ?v1)
             (pred_5 ?v11)
             (pred_8 ?v1)
             (pred_7 ))



(:action op_3
:parameters (?v4 ?v2 ?v5 ?v6)
:precondition (and (pred_6 ?v4) (pred_6 ?v2) (pred_2 ?v5) (pred_4 ?v6)
          (pred_1 ?v4 ?v2) (pred_9 ?v5 ?v6)
                   (pred_3 ?v2 ?v6) (pred_11 ?v4) 
                   (pred_12 ?v2) (pred_5 ?v5))
:effect (and  (pred_8 ?v2) (not (pred_12 ?v2))))


(:action op_2
:parameters (?v4 ?v3)
:precondition (and (pred_6 ?v4) (pred_6 ?v3)
               (pred_11 ?v4) (pred_1 ?v4 ?v3) (pred_8 ?v3))
:effect (and (pred_11 ?v3) (not (pred_11 ?v4))))

(:action op_1
:parameters (?v4 ?v5)
:precondition (and (pred_6 ?v4) (pred_2 ?v5) 
                  (pred_11 ?v4) (pred_10 ?v5 ?v4) (pred_7 ))
:effect (and (pred_5 ?v5)
   (not (pred_10 ?v5 ?v4)) (not (pred_7 ))))


(:action op_4
:parameters (?v4 ?v8 ?v13)
:precondition (and (pred_6 ?v4) (pred_2 ?v8) (pred_2 ?v13)
                  (pred_11 ?v4) (pred_5 ?v13) (pred_10 ?v8 ?v4))
:effect (and (pred_5 ?v8) (pred_10 ?v13 ?v4)
        (not (pred_5 ?v13)) (not (pred_10 ?v8 ?v4))))

(:action op_5
:parameters (?v4 ?v5)
:precondition (and (pred_6 ?v4) (pred_2 ?v5) 
                  (pred_11 ?v4) (pred_5 ?v5))
:effect (and (pred_7 ) (pred_10 ?v5 ?v4) (not (pred_5 ?v5)))))


	
