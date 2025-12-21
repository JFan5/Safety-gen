(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v12 ?v10)
             (pred_3 ?v8 ?v5)
             (pred_9 ?v12 ?v5)
             (pred_11 ?v11 ?v12 )
	     (pred_8 ?v12)
             (pred_7 ?v7)
             (pred_5 ?v8)
             (pred_10 ?v5)
             (pred_4 ?v12)
             (pred_12 ?v8)
             (pred_6 ?v12)
             (pred_2 ))



(:action op_1
:parameters (?v9 ?v2 ?v4 ?v3)
:precondition (and (pred_7 ?v9) (pred_7 ?v2) (pred_5 ?v4) (pred_10 ?v3)
          (pred_1 ?v9 ?v2) (pred_3 ?v4 ?v3)
                   (pred_9 ?v2 ?v3) (pred_8 ?v9) 
                   (pred_4 ?v2) (pred_12 ?v4))
:effect (and  (pred_6 ?v2) (not (pred_4 ?v2))))


(:action op_4
:parameters (?v9 ?v6)
:precondition (and (pred_7 ?v9) (pred_7 ?v6)
               (pred_8 ?v9) (pred_1 ?v9 ?v6) (pred_6 ?v6))
:effect (and (pred_8 ?v6) (not (pred_8 ?v9))))

(:action op_3
:parameters (?v9 ?v4)
:precondition (and (pred_7 ?v9) (pred_5 ?v4) 
                  (pred_8 ?v9) (pred_11 ?v4 ?v9) (pred_2 ))
:effect (and (pred_12 ?v4)
   (not (pred_11 ?v4 ?v9)) (not (pred_2 ))))


(:action op_2
:parameters (?v9 ?v13 ?v1)
:precondition (and (pred_7 ?v9) (pred_5 ?v13) (pred_5 ?v1)
                  (pred_8 ?v9) (pred_12 ?v1) (pred_11 ?v13 ?v9))
:effect (and (pred_12 ?v13) (pred_11 ?v1 ?v9)
        (not (pred_12 ?v1)) (not (pred_11 ?v13 ?v9))))

(:action op_5
:parameters (?v9 ?v4)
:precondition (and (pred_7 ?v9) (pred_5 ?v4) 
                  (pred_8 ?v9) (pred_12 ?v4))
:effect (and (pred_2 ) (pred_11 ?v4 ?v9) (not (pred_12 ?v4)))))


	
