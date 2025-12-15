(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v9 ?v2)
             (pred_8 ?v3 ?v1)
             (pred_12 ?v9 ?v1)
             (pred_9 ?v6 ?v9 )
	     (pred_11 ?v9)
             (pred_7 ?v8)
             (pred_5 ?v3)
             (pred_3 ?v1)
             (pred_2 ?v9)
             (pred_1 ?v3)
             (pred_6 ?v9)
             (pred_10 ))



(:action op_2
:parameters (?v4 ?v10 ?v5 ?v7)
:precondition (and (pred_7 ?v4) (pred_7 ?v10) (pred_5 ?v5) (pred_3 ?v7)
          (pred_4 ?v4 ?v10) (pred_8 ?v5 ?v7)
                   (pred_12 ?v10 ?v7) (pred_11 ?v4) 
                   (pred_2 ?v10) (pred_1 ?v5))
:effect (and  (pred_6 ?v10) (not (pred_2 ?v10))))


(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_7 ?v4) (pred_7 ?v11)
               (pred_11 ?v4) (pred_4 ?v4 ?v11) (pred_6 ?v11))
:effect (and (pred_11 ?v11) (not (pred_11 ?v4))))

(:action op_5
:parameters (?v4 ?v5)
:precondition (and (pred_7 ?v4) (pred_5 ?v5) 
                  (pred_11 ?v4) (pred_9 ?v5 ?v4) (pred_10 ))
:effect (and (pred_1 ?v5)
   (not (pred_9 ?v5 ?v4)) (not (pred_10 ))))


(:action op_1
:parameters (?v4 ?v13 ?v12)
:precondition (and (pred_7 ?v4) (pred_5 ?v13) (pred_5 ?v12)
                  (pred_11 ?v4) (pred_1 ?v12) (pred_9 ?v13 ?v4))
:effect (and (pred_1 ?v13) (pred_9 ?v12 ?v4)
        (not (pred_1 ?v12)) (not (pred_9 ?v13 ?v4))))

(:action op_3
:parameters (?v4 ?v5)
:precondition (and (pred_7 ?v4) (pred_5 ?v5) 
                  (pred_11 ?v4) (pred_1 ?v5))
:effect (and (pred_10 ) (pred_9 ?v5 ?v4) (not (pred_1 ?v5)))))


	
