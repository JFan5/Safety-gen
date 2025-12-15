(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v12 ?v8)
             (pred_11 ?v7 ?v1)
             (pred_4 ?v12 ?v1)
             (pred_5 ?v11 ?v12 )
	     (pred_8 ?v12)
             (pred_12 ?v13)
             (pred_6 ?v7)
             (pred_9 ?v1)
             (pred_2 ?v12)
             (pred_7 ?v7)
             (pred_3 ?v12)
             (pred_1 ))



(:action op_3
:parameters (?v5 ?v9 ?v2 ?v10)
:precondition (and (pred_12 ?v5) (pred_12 ?v9) (pred_6 ?v2) (pred_9 ?v10)
          (pred_10 ?v5 ?v9) (pred_11 ?v2 ?v10)
                   (pred_4 ?v9 ?v10) (pred_8 ?v5) 
                   (pred_2 ?v9) (pred_7 ?v2))
:effect (and  (pred_3 ?v9) (not (pred_2 ?v9))))


(:action op_4
:parameters (?v5 ?v3)
:precondition (and (pred_12 ?v5) (pred_12 ?v3)
               (pred_8 ?v5) (pred_10 ?v5 ?v3) (pred_3 ?v3))
:effect (and (pred_8 ?v3) (not (pred_8 ?v5))))

(:action op_2
:parameters (?v5 ?v2)
:precondition (and (pred_12 ?v5) (pred_6 ?v2) 
                  (pred_8 ?v5) (pred_5 ?v2 ?v5) (pred_1 ))
:effect (and (pred_7 ?v2)
   (not (pred_5 ?v2 ?v5)) (not (pred_1 ))))


(:action op_5
:parameters (?v5 ?v6 ?v4)
:precondition (and (pred_12 ?v5) (pred_6 ?v6) (pred_6 ?v4)
                  (pred_8 ?v5) (pred_7 ?v4) (pred_5 ?v6 ?v5))
:effect (and (pred_7 ?v6) (pred_5 ?v4 ?v5)
        (not (pred_7 ?v4)) (not (pred_5 ?v6 ?v5))))

(:action op_1
:parameters (?v5 ?v2)
:precondition (and (pred_12 ?v5) (pred_6 ?v2) 
                  (pred_8 ?v5) (pred_7 ?v2))
:effect (and (pred_1 ) (pred_5 ?v2 ?v5) (not (pred_7 ?v2)))))


	
