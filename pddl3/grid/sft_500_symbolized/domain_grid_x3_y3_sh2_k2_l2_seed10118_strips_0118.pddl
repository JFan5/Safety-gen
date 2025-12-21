(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v1 ?v3)
             (pred_7 ?v7 ?v9)
             (pred_8 ?v1 ?v9)
             (pred_4 ?v13 ?v1 )
	     (pred_10 ?v1)
             (pred_11 ?v11)
             (pred_9 ?v7)
             (pred_3 ?v9)
             (pred_12 ?v1)
             (pred_5 ?v7)
             (pred_2 ?v1)
             (pred_1 ))



(:action op_3
:parameters (?v4 ?v12 ?v10 ?v8)
:precondition (and (pred_11 ?v4) (pred_11 ?v12) (pred_9 ?v10) (pred_3 ?v8)
          (pred_6 ?v4 ?v12) (pred_7 ?v10 ?v8)
                   (pred_8 ?v12 ?v8) (pred_10 ?v4) 
                   (pred_12 ?v12) (pred_5 ?v10))
:effect (and  (pred_2 ?v12) (not (pred_12 ?v12))))


(:action op_2
:parameters (?v4 ?v5)
:precondition (and (pred_11 ?v4) (pred_11 ?v5)
               (pred_10 ?v4) (pred_6 ?v4 ?v5) (pred_2 ?v5))
:effect (and (pred_10 ?v5) (not (pred_10 ?v4))))

(:action op_5
:parameters (?v4 ?v10)
:precondition (and (pred_11 ?v4) (pred_9 ?v10) 
                  (pred_10 ?v4) (pred_4 ?v10 ?v4) (pred_1 ))
:effect (and (pred_5 ?v10)
   (not (pred_4 ?v10 ?v4)) (not (pred_1 ))))


(:action op_4
:parameters (?v4 ?v6 ?v2)
:precondition (and (pred_11 ?v4) (pred_9 ?v6) (pred_9 ?v2)
                  (pred_10 ?v4) (pred_5 ?v2) (pred_4 ?v6 ?v4))
:effect (and (pred_5 ?v6) (pred_4 ?v2 ?v4)
        (not (pred_5 ?v2)) (not (pred_4 ?v6 ?v4))))

(:action op_1
:parameters (?v4 ?v10)
:precondition (and (pred_11 ?v4) (pred_9 ?v10) 
                  (pred_10 ?v4) (pred_5 ?v10))
:effect (and (pred_1 ) (pred_4 ?v10 ?v4) (not (pred_5 ?v10)))))


	
