(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v8 ?v6)
             (pred_1 ?v7 ?v4)
             (pred_2 ?v8 ?v4)
             (pred_12 ?v11 ?v8 )
	     (pred_10 ?v8)
             (pred_4 ?v13)
             (pred_7 ?v7)
             (pred_6 ?v4)
             (pred_8 ?v8)
             (pred_5 ?v7)
             (pred_9 ?v8)
             (pred_11 ))



(:action op_3
:parameters (?v9 ?v2 ?v3 ?v12)
:precondition (and (pred_4 ?v9) (pred_4 ?v2) (pred_7 ?v3) (pred_6 ?v12)
          (pred_3 ?v9 ?v2) (pred_1 ?v3 ?v12)
                   (pred_2 ?v2 ?v12) (pred_10 ?v9) 
                   (pred_8 ?v2) (pred_5 ?v3))
:effect (and  (pred_9 ?v2) (not (pred_8 ?v2))))


(:action op_1
:parameters (?v9 ?v1)
:precondition (and (pred_4 ?v9) (pred_4 ?v1)
               (pred_10 ?v9) (pred_3 ?v9 ?v1) (pred_9 ?v1))
:effect (and (pred_10 ?v1) (not (pred_10 ?v9))))

(:action op_2
:parameters (?v9 ?v3)
:precondition (and (pred_4 ?v9) (pred_7 ?v3) 
                  (pred_10 ?v9) (pred_12 ?v3 ?v9) (pred_11 ))
:effect (and (pred_5 ?v3)
   (not (pred_12 ?v3 ?v9)) (not (pred_11 ))))


(:action op_4
:parameters (?v9 ?v10 ?v5)
:precondition (and (pred_4 ?v9) (pred_7 ?v10) (pred_7 ?v5)
                  (pred_10 ?v9) (pred_5 ?v5) (pred_12 ?v10 ?v9))
:effect (and (pred_5 ?v10) (pred_12 ?v5 ?v9)
        (not (pred_5 ?v5)) (not (pred_12 ?v10 ?v9))))

(:action op_5
:parameters (?v9 ?v3)
:precondition (and (pred_4 ?v9) (pred_7 ?v3) 
                  (pred_10 ?v9) (pred_5 ?v3))
:effect (and (pred_11 ) (pred_12 ?v3 ?v9) (not (pred_5 ?v3)))))


	
