(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v8 ?v12)
             (pred_12 ?v13 ?v4)
             (pred_4 ?v8 ?v4)
             (pred_2 ?v11 ?v8 )
	     (pred_5 ?v8)
             (pred_7 ?v5)
             (pred_3 ?v13)
             (pred_8 ?v4)
             (pred_1 ?v8)
             (pred_9 ?v13)
             (pred_10 ?v8)
             (pred_11 ))



(:action op_3
:parameters (?v9 ?v2 ?v6 ?v7)
:precondition (and (pred_7 ?v9) (pred_7 ?v2) (pred_3 ?v6) (pred_8 ?v7)
          (pred_6 ?v9 ?v2) (pred_12 ?v6 ?v7)
                   (pred_4 ?v2 ?v7) (pred_5 ?v9) 
                   (pred_1 ?v2) (pred_9 ?v6))
:effect (and  (pred_10 ?v2) (not (pred_1 ?v2))))


(:action op_1
:parameters (?v9 ?v10)
:precondition (and (pred_7 ?v9) (pred_7 ?v10)
               (pred_5 ?v9) (pred_6 ?v9 ?v10) (pred_10 ?v10))
:effect (and (pred_5 ?v10) (not (pred_5 ?v9))))

(:action op_4
:parameters (?v9 ?v6)
:precondition (and (pred_7 ?v9) (pred_3 ?v6) 
                  (pred_5 ?v9) (pred_2 ?v6 ?v9) (pred_11 ))
:effect (and (pred_9 ?v6)
   (not (pred_2 ?v6 ?v9)) (not (pred_11 ))))


(:action op_2
:parameters (?v9 ?v3 ?v1)
:precondition (and (pred_7 ?v9) (pred_3 ?v3) (pred_3 ?v1)
                  (pred_5 ?v9) (pred_9 ?v1) (pred_2 ?v3 ?v9))
:effect (and (pred_9 ?v3) (pred_2 ?v1 ?v9)
        (not (pred_9 ?v1)) (not (pred_2 ?v3 ?v9))))

(:action op_5
:parameters (?v9 ?v6)
:precondition (and (pred_7 ?v9) (pred_3 ?v6) 
                  (pred_5 ?v9) (pred_9 ?v6))
:effect (and (pred_11 ) (pred_2 ?v6 ?v9) (not (pred_9 ?v6)))))


	
