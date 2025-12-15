(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v2)
             (pred_3 ?v1 ?v5)
             (pred_5 ?v9 ?v5)
             (pred_8 ?v8 ?v9 )
	     (pred_9 ?v9)
             (pred_11 ?v3)
             (pred_2 ?v1)
             (pred_4 ?v5)
             (pred_7 ?v9)
             (pred_12 ?v1)
             (pred_1 ?v9)
             (pred_6 ))



(:action op_3
:parameters (?v4 ?v10 ?v7 ?v13)
:precondition (and (pred_11 ?v4) (pred_11 ?v10) (pred_2 ?v7) (pred_4 ?v13)
          (pred_10 ?v4 ?v10) (pred_3 ?v7 ?v13)
                   (pred_5 ?v10 ?v13) (pred_9 ?v4) 
                   (pred_7 ?v10) (pred_12 ?v7))
:effect (and  (pred_1 ?v10) (not (pred_7 ?v10))))


(:action op_4
:parameters (?v4 ?v11)
:precondition (and (pred_11 ?v4) (pred_11 ?v11)
               (pred_9 ?v4) (pred_10 ?v4 ?v11) (pred_1 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v4))))

(:action op_1
:parameters (?v4 ?v7)
:precondition (and (pred_11 ?v4) (pred_2 ?v7) 
                  (pred_9 ?v4) (pred_8 ?v7 ?v4) (pred_6 ))
:effect (and (pred_12 ?v7)
   (not (pred_8 ?v7 ?v4)) (not (pred_6 ))))


(:action op_5
:parameters (?v4 ?v6 ?v12)
:precondition (and (pred_11 ?v4) (pred_2 ?v6) (pred_2 ?v12)
                  (pred_9 ?v4) (pred_12 ?v12) (pred_8 ?v6 ?v4))
:effect (and (pred_12 ?v6) (pred_8 ?v12 ?v4)
        (not (pred_12 ?v12)) (not (pred_8 ?v6 ?v4))))

(:action op_2
:parameters (?v4 ?v7)
:precondition (and (pred_11 ?v4) (pred_2 ?v7) 
                  (pred_9 ?v4) (pred_12 ?v7))
:effect (and (pred_6 ) (pred_8 ?v7 ?v4) (not (pred_12 ?v7)))))


	
