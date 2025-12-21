(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v8 ?v11)
             (pred_1 ?v7 ?v6)
             (pred_6 ?v8 ?v6)
             (pred_5 ?v2 ?v8 )
	     (pred_12 ?v8)
             (pred_4 ?v10)
             (pred_3 ?v7)
             (pred_11 ?v6)
             (pred_10 ?v8)
             (pred_9 ?v7)
             (pred_2 ?v8)
             (pred_8 ))



(:action op_1
:parameters (?v4 ?v12 ?v13 ?v1)
:precondition (and (pred_4 ?v4) (pred_4 ?v12) (pred_3 ?v13) (pred_11 ?v1)
          (pred_7 ?v4 ?v12) (pred_1 ?v13 ?v1)
                   (pred_6 ?v12 ?v1) (pred_12 ?v4) 
                   (pred_10 ?v12) (pred_9 ?v13))
:effect (and  (pred_2 ?v12) (not (pred_10 ?v12))))


(:action op_4
:parameters (?v4 ?v3)
:precondition (and (pred_4 ?v4) (pred_4 ?v3)
               (pred_12 ?v4) (pred_7 ?v4 ?v3) (pred_2 ?v3))
:effect (and (pred_12 ?v3) (not (pred_12 ?v4))))

(:action op_2
:parameters (?v4 ?v13)
:precondition (and (pred_4 ?v4) (pred_3 ?v13) 
                  (pred_12 ?v4) (pred_5 ?v13 ?v4) (pred_8 ))
:effect (and (pred_9 ?v13)
   (not (pred_5 ?v13 ?v4)) (not (pred_8 ))))


(:action op_3
:parameters (?v4 ?v5 ?v9)
:precondition (and (pred_4 ?v4) (pred_3 ?v5) (pred_3 ?v9)
                  (pred_12 ?v4) (pred_9 ?v9) (pred_5 ?v5 ?v4))
:effect (and (pred_9 ?v5) (pred_5 ?v9 ?v4)
        (not (pred_9 ?v9)) (not (pred_5 ?v5 ?v4))))

(:action op_5
:parameters (?v4 ?v13)
:precondition (and (pred_4 ?v4) (pred_3 ?v13) 
                  (pred_12 ?v4) (pred_9 ?v13))
:effect (and (pred_8 ) (pred_5 ?v13 ?v4) (not (pred_9 ?v13)))))


	
