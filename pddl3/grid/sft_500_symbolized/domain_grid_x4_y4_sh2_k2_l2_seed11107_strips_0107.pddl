(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v1 ?v13)
             (pred_6 ?v5 ?v4)
             (pred_4 ?v1 ?v4)
             (pred_12 ?v8 ?v1 )
	     (pred_8 ?v1)
             (pred_10 ?v7)
             (pred_7 ?v5)
             (pred_2 ?v4)
             (pred_3 ?v1)
             (pred_9 ?v5)
             (pred_1 ?v1)
             (pred_11 ))



(:action op_1
:parameters (?v12 ?v9 ?v2 ?v6)
:precondition (and (pred_10 ?v12) (pred_10 ?v9) (pred_7 ?v2) (pred_2 ?v6)
          (pred_5 ?v12 ?v9) (pred_6 ?v2 ?v6)
                   (pred_4 ?v9 ?v6) (pred_8 ?v12) 
                   (pred_3 ?v9) (pred_9 ?v2))
:effect (and  (pred_1 ?v9) (not (pred_3 ?v9))))


(:action op_2
:parameters (?v12 ?v10)
:precondition (and (pred_10 ?v12) (pred_10 ?v10)
               (pred_8 ?v12) (pred_5 ?v12 ?v10) (pred_1 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v12))))

(:action op_5
:parameters (?v12 ?v2)
:precondition (and (pred_10 ?v12) (pred_7 ?v2) 
                  (pred_8 ?v12) (pred_12 ?v2 ?v12) (pred_11 ))
:effect (and (pred_9 ?v2)
   (not (pred_12 ?v2 ?v12)) (not (pred_11 ))))


(:action op_3
:parameters (?v12 ?v11 ?v3)
:precondition (and (pred_10 ?v12) (pred_7 ?v11) (pred_7 ?v3)
                  (pred_8 ?v12) (pred_9 ?v3) (pred_12 ?v11 ?v12))
:effect (and (pred_9 ?v11) (pred_12 ?v3 ?v12)
        (not (pred_9 ?v3)) (not (pred_12 ?v11 ?v12))))

(:action op_4
:parameters (?v12 ?v2)
:precondition (and (pred_10 ?v12) (pred_7 ?v2) 
                  (pred_8 ?v12) (pred_9 ?v2))
:effect (and (pred_11 ) (pred_12 ?v2 ?v12) (not (pred_9 ?v2)))))


	
