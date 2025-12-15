(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v11 ?v7)
             (pred_2 ?v8 ?v5)
             (pred_11 ?v11 ?v5)
             (pred_12 ?v13 ?v11 )
	     (pred_7 ?v11)
             (pred_6 ?v1)
             (pred_1 ?v8)
             (pred_3 ?v5)
             (pred_9 ?v11)
             (pred_8 ?v8)
             (pred_4 ?v11)
             (pred_5 ))



(:action op_3
:parameters (?v9 ?v2 ?v6 ?v3)
:precondition (and (pred_6 ?v9) (pred_6 ?v2) (pred_1 ?v6) (pred_3 ?v3)
          (pred_10 ?v9 ?v2) (pred_2 ?v6 ?v3)
                   (pred_11 ?v2 ?v3) (pred_7 ?v9) 
                   (pred_9 ?v2) (pred_8 ?v6))
:effect (and  (pred_4 ?v2) (not (pred_9 ?v2))))


(:action op_4
:parameters (?v9 ?v12)
:precondition (and (pred_6 ?v9) (pred_6 ?v12)
               (pred_7 ?v9) (pred_10 ?v9 ?v12) (pred_4 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v9))))

(:action op_5
:parameters (?v9 ?v6)
:precondition (and (pred_6 ?v9) (pred_1 ?v6) 
                  (pred_7 ?v9) (pred_12 ?v6 ?v9) (pred_5 ))
:effect (and (pred_8 ?v6)
   (not (pred_12 ?v6 ?v9)) (not (pred_5 ))))


(:action op_2
:parameters (?v9 ?v10 ?v4)
:precondition (and (pred_6 ?v9) (pred_1 ?v10) (pred_1 ?v4)
                  (pred_7 ?v9) (pred_8 ?v4) (pred_12 ?v10 ?v9))
:effect (and (pred_8 ?v10) (pred_12 ?v4 ?v9)
        (not (pred_8 ?v4)) (not (pred_12 ?v10 ?v9))))

(:action op_1
:parameters (?v9 ?v6)
:precondition (and (pred_6 ?v9) (pred_1 ?v6) 
                  (pred_7 ?v9) (pred_8 ?v6))
:effect (and (pred_5 ) (pred_12 ?v6 ?v9) (not (pred_8 ?v6)))))


	
