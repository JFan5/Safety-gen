(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v7 ?v9)
             (pred_8 ?v10 ?v12)
             (pred_7 ?v7 ?v12)
             (pred_6 ?v6 ?v7 )
	     (pred_4 ?v7)
             (pred_5 ?v8)
             (pred_9 ?v10)
             (pred_11 ?v12)
             (pred_3 ?v7)
             (pred_1 ?v10)
             (pred_2 ?v7)
             (pred_12 ))



(:action op_4
:parameters (?v5 ?v4 ?v13 ?v3)
:precondition (and (pred_5 ?v5) (pred_5 ?v4) (pred_9 ?v13) (pred_11 ?v3)
          (pred_10 ?v5 ?v4) (pred_8 ?v13 ?v3)
                   (pred_7 ?v4 ?v3) (pred_4 ?v5) 
                   (pred_3 ?v4) (pred_1 ?v13))
:effect (and  (pred_2 ?v4) (not (pred_3 ?v4))))


(:action op_5
:parameters (?v5 ?v1)
:precondition (and (pred_5 ?v5) (pred_5 ?v1)
               (pred_4 ?v5) (pred_10 ?v5 ?v1) (pred_2 ?v1))
:effect (and (pred_4 ?v1) (not (pred_4 ?v5))))

(:action op_1
:parameters (?v5 ?v13)
:precondition (and (pred_5 ?v5) (pred_9 ?v13) 
                  (pred_4 ?v5) (pred_6 ?v13 ?v5) (pred_12 ))
:effect (and (pred_1 ?v13)
   (not (pred_6 ?v13 ?v5)) (not (pred_12 ))))


(:action op_2
:parameters (?v5 ?v11 ?v2)
:precondition (and (pred_5 ?v5) (pred_9 ?v11) (pred_9 ?v2)
                  (pred_4 ?v5) (pred_1 ?v2) (pred_6 ?v11 ?v5))
:effect (and (pred_1 ?v11) (pred_6 ?v2 ?v5)
        (not (pred_1 ?v2)) (not (pred_6 ?v11 ?v5))))

(:action op_3
:parameters (?v5 ?v13)
:precondition (and (pred_5 ?v5) (pred_9 ?v13) 
                  (pred_4 ?v5) (pred_1 ?v13))
:effect (and (pred_12 ) (pred_6 ?v13 ?v5) (not (pred_1 ?v13)))))


	
