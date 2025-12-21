(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v7 ?v13)
             (pred_12 ?v3 ?v1)
             (pred_2 ?v7 ?v1)
             (pred_1 ?v5 ?v7 )
	     (pred_10 ?v7)
             (pred_8 ?v10)
             (pred_7 ?v3)
             (pred_4 ?v1)
             (pred_5 ?v7)
             (pred_9 ?v3)
             (pred_3 ?v7)
             (pred_6 ))



(:action op_5
:parameters (?v9 ?v2 ?v8 ?v11)
:precondition (and (pred_8 ?v9) (pred_8 ?v2) (pred_7 ?v8) (pred_4 ?v11)
          (pred_11 ?v9 ?v2) (pred_12 ?v8 ?v11)
                   (pred_2 ?v2 ?v11) (pred_10 ?v9) 
                   (pred_5 ?v2) (pred_9 ?v8))
:effect (and  (pred_3 ?v2) (not (pred_5 ?v2))))


(:action op_4
:parameters (?v9 ?v6)
:precondition (and (pred_8 ?v9) (pred_8 ?v6)
               (pred_10 ?v9) (pred_11 ?v9 ?v6) (pred_3 ?v6))
:effect (and (pred_10 ?v6) (not (pred_10 ?v9))))

(:action op_2
:parameters (?v9 ?v8)
:precondition (and (pred_8 ?v9) (pred_7 ?v8) 
                  (pred_10 ?v9) (pred_1 ?v8 ?v9) (pred_6 ))
:effect (and (pred_9 ?v8)
   (not (pred_1 ?v8 ?v9)) (not (pred_6 ))))


(:action op_1
:parameters (?v9 ?v4 ?v12)
:precondition (and (pred_8 ?v9) (pred_7 ?v4) (pred_7 ?v12)
                  (pred_10 ?v9) (pred_9 ?v12) (pred_1 ?v4 ?v9))
:effect (and (pred_9 ?v4) (pred_1 ?v12 ?v9)
        (not (pred_9 ?v12)) (not (pred_1 ?v4 ?v9))))

(:action op_3
:parameters (?v9 ?v8)
:precondition (and (pred_8 ?v9) (pred_7 ?v8) 
                  (pred_10 ?v9) (pred_9 ?v8))
:effect (and (pred_6 ) (pred_1 ?v8 ?v9) (not (pred_9 ?v8)))))


	
