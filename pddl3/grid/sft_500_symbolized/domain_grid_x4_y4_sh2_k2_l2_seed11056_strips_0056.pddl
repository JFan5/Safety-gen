(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v4 ?v7)
             (pred_8 ?v9 ?v6)
             (pred_9 ?v4 ?v6)
             (pred_1 ?v11 ?v4 )
	     (pred_2 ?v4)
             (pred_10 ?v8)
             (pred_3 ?v9)
             (pred_7 ?v6)
             (pred_12 ?v4)
             (pred_11 ?v9)
             (pred_6 ?v4)
             (pred_4 ))



(:action op_4
:parameters (?v5 ?v2 ?v1 ?v3)
:precondition (and (pred_10 ?v5) (pred_10 ?v2) (pred_3 ?v1) (pred_7 ?v3)
          (pred_5 ?v5 ?v2) (pred_8 ?v1 ?v3)
                   (pred_9 ?v2 ?v3) (pred_2 ?v5) 
                   (pred_12 ?v2) (pred_11 ?v1))
:effect (and  (pred_6 ?v2) (not (pred_12 ?v2))))


(:action op_3
:parameters (?v5 ?v13)
:precondition (and (pred_10 ?v5) (pred_10 ?v13)
               (pred_2 ?v5) (pred_5 ?v5 ?v13) (pred_6 ?v13))
:effect (and (pred_2 ?v13) (not (pred_2 ?v5))))

(:action op_2
:parameters (?v5 ?v1)
:precondition (and (pred_10 ?v5) (pred_3 ?v1) 
                  (pred_2 ?v5) (pred_1 ?v1 ?v5) (pred_4 ))
:effect (and (pred_11 ?v1)
   (not (pred_1 ?v1 ?v5)) (not (pred_4 ))))


(:action op_1
:parameters (?v5 ?v10 ?v12)
:precondition (and (pred_10 ?v5) (pred_3 ?v10) (pred_3 ?v12)
                  (pred_2 ?v5) (pred_11 ?v12) (pred_1 ?v10 ?v5))
:effect (and (pred_11 ?v10) (pred_1 ?v12 ?v5)
        (not (pred_11 ?v12)) (not (pred_1 ?v10 ?v5))))

(:action op_5
:parameters (?v5 ?v1)
:precondition (and (pred_10 ?v5) (pred_3 ?v1) 
                  (pred_2 ?v5) (pred_11 ?v1))
:effect (and (pred_4 ) (pred_1 ?v1 ?v5) (not (pred_11 ?v1)))))


	
