(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v13 ?v11)
             (pred_3 ?v1 ?v7)
             (pred_10 ?v13 ?v7)
             (pred_12 ?v9 ?v13 )
	     (pred_9 ?v13)
             (pred_5 ?v5)
             (pred_11 ?v1)
             (pred_1 ?v7)
             (pred_8 ?v13)
             (pred_4 ?v1)
             (pred_7 ?v13)
             (pred_2 ))



(:action op_1
:parameters (?v12 ?v8 ?v10 ?v3)
:precondition (and (pred_5 ?v12) (pred_5 ?v8) (pred_11 ?v10) (pred_1 ?v3)
          (pred_6 ?v12 ?v8) (pred_3 ?v10 ?v3)
                   (pred_10 ?v8 ?v3) (pred_9 ?v12) 
                   (pred_8 ?v8) (pred_4 ?v10))
:effect (and  (pred_7 ?v8) (not (pred_8 ?v8))))


(:action op_5
:parameters (?v12 ?v6)
:precondition (and (pred_5 ?v12) (pred_5 ?v6)
               (pred_9 ?v12) (pred_6 ?v12 ?v6) (pred_7 ?v6))
:effect (and (pred_9 ?v6) (not (pred_9 ?v12))))

(:action op_2
:parameters (?v12 ?v10)
:precondition (and (pred_5 ?v12) (pred_11 ?v10) 
                  (pred_9 ?v12) (pred_12 ?v10 ?v12) (pred_2 ))
:effect (and (pred_4 ?v10)
   (not (pred_12 ?v10 ?v12)) (not (pred_2 ))))


(:action op_4
:parameters (?v12 ?v4 ?v2)
:precondition (and (pred_5 ?v12) (pred_11 ?v4) (pred_11 ?v2)
                  (pred_9 ?v12) (pred_4 ?v2) (pred_12 ?v4 ?v12))
:effect (and (pred_4 ?v4) (pred_12 ?v2 ?v12)
        (not (pred_4 ?v2)) (not (pred_12 ?v4 ?v12))))

(:action op_3
:parameters (?v12 ?v10)
:precondition (and (pred_5 ?v12) (pred_11 ?v10) 
                  (pred_9 ?v12) (pred_4 ?v10))
:effect (and (pred_2 ) (pred_12 ?v10 ?v12) (not (pred_4 ?v10)))))


	
