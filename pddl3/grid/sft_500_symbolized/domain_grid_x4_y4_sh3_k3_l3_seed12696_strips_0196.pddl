(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v5 ?v9)
             (pred_8 ?v12 ?v1)
             (pred_3 ?v5 ?v1)
             (pred_2 ?v6 ?v5 )
	     (pred_4 ?v5)
             (pred_12 ?v3)
             (pred_7 ?v12)
             (pred_5 ?v1)
             (pred_10 ?v5)
             (pred_6 ?v12)
             (pred_9 ?v5)
             (pred_11 ))



(:action op_2
:parameters (?v4 ?v2 ?v10 ?v7)
:precondition (and (pred_12 ?v4) (pred_12 ?v2) (pred_7 ?v10) (pred_5 ?v7)
          (pred_1 ?v4 ?v2) (pred_8 ?v10 ?v7)
                   (pred_3 ?v2 ?v7) (pred_4 ?v4) 
                   (pred_10 ?v2) (pred_6 ?v10))
:effect (and  (pred_9 ?v2) (not (pred_10 ?v2))))


(:action op_1
:parameters (?v4 ?v13)
:precondition (and (pred_12 ?v4) (pred_12 ?v13)
               (pred_4 ?v4) (pred_1 ?v4 ?v13) (pred_9 ?v13))
:effect (and (pred_4 ?v13) (not (pred_4 ?v4))))

(:action op_3
:parameters (?v4 ?v10)
:precondition (and (pred_12 ?v4) (pred_7 ?v10) 
                  (pred_4 ?v4) (pred_2 ?v10 ?v4) (pred_11 ))
:effect (and (pred_6 ?v10)
   (not (pred_2 ?v10 ?v4)) (not (pred_11 ))))


(:action op_4
:parameters (?v4 ?v8 ?v11)
:precondition (and (pred_12 ?v4) (pred_7 ?v8) (pred_7 ?v11)
                  (pred_4 ?v4) (pred_6 ?v11) (pred_2 ?v8 ?v4))
:effect (and (pred_6 ?v8) (pred_2 ?v11 ?v4)
        (not (pred_6 ?v11)) (not (pred_2 ?v8 ?v4))))

(:action op_5
:parameters (?v4 ?v10)
:precondition (and (pred_12 ?v4) (pred_7 ?v10) 
                  (pred_4 ?v4) (pred_6 ?v10))
:effect (and (pred_11 ) (pred_2 ?v10 ?v4) (not (pred_6 ?v10)))))


	
