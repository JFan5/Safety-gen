(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v4 ?v3)
             (pred_3 ?v1 ?v11)
             (pred_9 ?v4 ?v11)
             (pred_4 ?v13 ?v4 )
	     (pred_2 ?v4)
             (pred_11 ?v10)
             (pred_12 ?v1)
             (pred_1 ?v11)
             (pred_6 ?v4)
             (pred_7 ?v1)
             (pred_8 ?v4)
             (pred_5 ))



(:action op_1
:parameters (?v9 ?v2 ?v8 ?v7)
:precondition (and (pred_11 ?v9) (pred_11 ?v2) (pred_12 ?v8) (pred_1 ?v7)
          (pred_10 ?v9 ?v2) (pred_3 ?v8 ?v7)
                   (pred_9 ?v2 ?v7) (pred_2 ?v9) 
                   (pred_6 ?v2) (pred_7 ?v8))
:effect (and  (pred_8 ?v2) (not (pred_6 ?v2))))


(:action op_5
:parameters (?v9 ?v5)
:precondition (and (pred_11 ?v9) (pred_11 ?v5)
               (pred_2 ?v9) (pred_10 ?v9 ?v5) (pred_8 ?v5))
:effect (and (pred_2 ?v5) (not (pred_2 ?v9))))

(:action op_3
:parameters (?v9 ?v8)
:precondition (and (pred_11 ?v9) (pred_12 ?v8) 
                  (pred_2 ?v9) (pred_4 ?v8 ?v9) (pred_5 ))
:effect (and (pred_7 ?v8)
   (not (pred_4 ?v8 ?v9)) (not (pred_5 ))))


(:action op_4
:parameters (?v9 ?v12 ?v6)
:precondition (and (pred_11 ?v9) (pred_12 ?v12) (pred_12 ?v6)
                  (pred_2 ?v9) (pred_7 ?v6) (pred_4 ?v12 ?v9))
:effect (and (pred_7 ?v12) (pred_4 ?v6 ?v9)
        (not (pred_7 ?v6)) (not (pred_4 ?v12 ?v9))))

(:action op_2
:parameters (?v9 ?v8)
:precondition (and (pred_11 ?v9) (pred_12 ?v8) 
                  (pred_2 ?v9) (pred_7 ?v8))
:effect (and (pred_5 ) (pred_4 ?v8 ?v9) (not (pred_7 ?v8)))))


	
