(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v11 ?v10)
             (pred_4 ?v3 ?v2)
             (pred_3 ?v11 ?v2)
             (pred_12 ?v6 ?v11 )
	     (pred_7 ?v11)
             (pred_6 ?v7)
             (pred_11 ?v3)
             (pred_9 ?v2)
             (pred_10 ?v11)
             (pred_1 ?v3)
             (pred_8 ?v11)
             (pred_2 ))



(:action op_3
:parameters (?v12 ?v9 ?v5 ?v13)
:precondition (and (pred_6 ?v12) (pred_6 ?v9) (pred_11 ?v5) (pred_9 ?v13)
          (pred_5 ?v12 ?v9) (pred_4 ?v5 ?v13)
                   (pred_3 ?v9 ?v13) (pred_7 ?v12) 
                   (pred_10 ?v9) (pred_1 ?v5))
:effect (and  (pred_8 ?v9) (not (pred_10 ?v9))))


(:action op_4
:parameters (?v12 ?v8)
:precondition (and (pred_6 ?v12) (pred_6 ?v8)
               (pred_7 ?v12) (pred_5 ?v12 ?v8) (pred_8 ?v8))
:effect (and (pred_7 ?v8) (not (pred_7 ?v12))))

(:action op_5
:parameters (?v12 ?v5)
:precondition (and (pred_6 ?v12) (pred_11 ?v5) 
                  (pred_7 ?v12) (pred_12 ?v5 ?v12) (pred_2 ))
:effect (and (pred_1 ?v5)
   (not (pred_12 ?v5 ?v12)) (not (pred_2 ))))


(:action op_2
:parameters (?v12 ?v1 ?v4)
:precondition (and (pred_6 ?v12) (pred_11 ?v1) (pred_11 ?v4)
                  (pred_7 ?v12) (pred_1 ?v4) (pred_12 ?v1 ?v12))
:effect (and (pred_1 ?v1) (pred_12 ?v4 ?v12)
        (not (pred_1 ?v4)) (not (pred_12 ?v1 ?v12))))

(:action op_1
:parameters (?v12 ?v5)
:precondition (and (pred_6 ?v12) (pred_11 ?v5) 
                  (pred_7 ?v12) (pred_1 ?v5))
:effect (and (pred_2 ) (pred_12 ?v5 ?v12) (not (pred_1 ?v5)))))


	
