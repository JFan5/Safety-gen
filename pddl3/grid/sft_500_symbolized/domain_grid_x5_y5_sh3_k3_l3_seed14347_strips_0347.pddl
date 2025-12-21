(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v13 ?v1)
             (pred_7 ?v6 ?v5)
             (pred_1 ?v13 ?v5)
             (pred_12 ?v8 ?v13 )
	     (pred_10 ?v13)
             (pred_6 ?v11)
             (pred_9 ?v6)
             (pred_5 ?v5)
             (pred_3 ?v13)
             (pred_2 ?v6)
             (pred_8 ?v13)
             (pred_4 ))



(:action op_2
:parameters (?v4 ?v12 ?v10 ?v9)
:precondition (and (pred_6 ?v4) (pred_6 ?v12) (pred_9 ?v10) (pred_5 ?v9)
          (pred_11 ?v4 ?v12) (pred_7 ?v10 ?v9)
                   (pred_1 ?v12 ?v9) (pred_10 ?v4) 
                   (pred_3 ?v12) (pred_2 ?v10))
:effect (and  (pred_8 ?v12) (not (pred_3 ?v12))))


(:action op_4
:parameters (?v4 ?v2)
:precondition (and (pred_6 ?v4) (pred_6 ?v2)
               (pred_10 ?v4) (pred_11 ?v4 ?v2) (pred_8 ?v2))
:effect (and (pred_10 ?v2) (not (pred_10 ?v4))))

(:action op_1
:parameters (?v4 ?v10)
:precondition (and (pred_6 ?v4) (pred_9 ?v10) 
                  (pred_10 ?v4) (pred_12 ?v10 ?v4) (pred_4 ))
:effect (and (pred_2 ?v10)
   (not (pred_12 ?v10 ?v4)) (not (pred_4 ))))


(:action op_3
:parameters (?v4 ?v7 ?v3)
:precondition (and (pred_6 ?v4) (pred_9 ?v7) (pred_9 ?v3)
                  (pred_10 ?v4) (pred_2 ?v3) (pred_12 ?v7 ?v4))
:effect (and (pred_2 ?v7) (pred_12 ?v3 ?v4)
        (not (pred_2 ?v3)) (not (pred_12 ?v7 ?v4))))

(:action op_5
:parameters (?v4 ?v10)
:precondition (and (pred_6 ?v4) (pred_9 ?v10) 
                  (pred_10 ?v4) (pred_2 ?v10))
:effect (and (pred_4 ) (pred_12 ?v10 ?v4) (not (pred_2 ?v10)))))


	
