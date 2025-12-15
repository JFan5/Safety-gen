(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v7 ?v6)
             (pred_12 ?v11 ?v2)
             (pred_4 ?v7 ?v2)
             (pred_8 ?v8 ?v7 )
	     (pred_6 ?v7)
             (pred_9 ?v9)
             (pred_7 ?v11)
             (pred_2 ?v2)
             (pred_11 ?v7)
             (pred_3 ?v11)
             (pred_5 ?v7)
             (pred_1 ))



(:action op_2
:parameters (?v4 ?v10 ?v1 ?v13)
:precondition (and (pred_9 ?v4) (pred_9 ?v10) (pred_7 ?v1) (pred_2 ?v13)
          (pred_10 ?v4 ?v10) (pred_12 ?v1 ?v13)
                   (pred_4 ?v10 ?v13) (pred_6 ?v4) 
                   (pred_11 ?v10) (pred_3 ?v1))
:effect (and  (pred_5 ?v10) (not (pred_11 ?v10))))


(:action op_1
:parameters (?v4 ?v5)
:precondition (and (pred_9 ?v4) (pred_9 ?v5)
               (pred_6 ?v4) (pred_10 ?v4 ?v5) (pred_5 ?v5))
:effect (and (pred_6 ?v5) (not (pred_6 ?v4))))

(:action op_4
:parameters (?v4 ?v1)
:precondition (and (pred_9 ?v4) (pred_7 ?v1) 
                  (pred_6 ?v4) (pred_8 ?v1 ?v4) (pred_1 ))
:effect (and (pred_3 ?v1)
   (not (pred_8 ?v1 ?v4)) (not (pred_1 ))))


(:action op_3
:parameters (?v4 ?v3 ?v12)
:precondition (and (pred_9 ?v4) (pred_7 ?v3) (pred_7 ?v12)
                  (pred_6 ?v4) (pred_3 ?v12) (pred_8 ?v3 ?v4))
:effect (and (pred_3 ?v3) (pred_8 ?v12 ?v4)
        (not (pred_3 ?v12)) (not (pred_8 ?v3 ?v4))))

(:action op_5
:parameters (?v4 ?v1)
:precondition (and (pred_9 ?v4) (pred_7 ?v1) 
                  (pred_6 ?v4) (pred_3 ?v1))
:effect (and (pred_1 ) (pred_8 ?v1 ?v4) (not (pred_3 ?v1)))))


	
