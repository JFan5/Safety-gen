(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v6)
             (pred_6 ?v13 ?v4)
             (pred_8 ?v5 ?v4)
             (pred_3 ?v7 ?v5 )
	     (pred_12 ?v5)
             (pred_11 ?v2)
             (pred_10 ?v13)
             (pred_5 ?v4)
             (pred_9 ?v5)
             (pred_2 ?v13)
             (pred_4 ?v5)
             (pred_1 ))



(:action op_1
:parameters (?v12 ?v9 ?v1 ?v3)
:precondition (and (pred_11 ?v12) (pred_11 ?v9) (pred_10 ?v1) (pred_5 ?v3)
          (pred_7 ?v12 ?v9) (pred_6 ?v1 ?v3)
                   (pred_8 ?v9 ?v3) (pred_12 ?v12) 
                   (pred_9 ?v9) (pred_2 ?v1))
:effect (and  (pred_4 ?v9) (not (pred_9 ?v9))))


(:action op_2
:parameters (?v12 ?v10)
:precondition (and (pred_11 ?v12) (pred_11 ?v10)
               (pred_12 ?v12) (pred_7 ?v12 ?v10) (pred_4 ?v10))
:effect (and (pred_12 ?v10) (not (pred_12 ?v12))))

(:action op_5
:parameters (?v12 ?v1)
:precondition (and (pred_11 ?v12) (pred_10 ?v1) 
                  (pred_12 ?v12) (pred_3 ?v1 ?v12) (pred_1 ))
:effect (and (pred_2 ?v1)
   (not (pred_3 ?v1 ?v12)) (not (pred_1 ))))


(:action op_3
:parameters (?v12 ?v8 ?v11)
:precondition (and (pred_11 ?v12) (pred_10 ?v8) (pred_10 ?v11)
                  (pred_12 ?v12) (pred_2 ?v11) (pred_3 ?v8 ?v12))
:effect (and (pred_2 ?v8) (pred_3 ?v11 ?v12)
        (not (pred_2 ?v11)) (not (pred_3 ?v8 ?v12))))

(:action op_4
:parameters (?v12 ?v1)
:precondition (and (pred_11 ?v12) (pred_10 ?v1) 
                  (pred_12 ?v12) (pred_2 ?v1))
:effect (and (pred_1 ) (pred_3 ?v1 ?v12) (not (pred_2 ?v1)))))


	
