(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v7 ?v6)
             (pred_4 ?v2 ?v3)
             (pred_7 ?v7 ?v3)
             (pred_8 ?v1 ?v7 )
	     (pred_11 ?v7)
             (pred_3 ?v8)
             (pred_12 ?v2)
             (pred_1 ?v3)
             (pred_5 ?v7)
             (pred_9 ?v2)
             (pred_10 ?v7)
             (pred_2 ))



(:action op_4
:parameters (?v9 ?v4 ?v13 ?v11)
:precondition (and (pred_3 ?v9) (pred_3 ?v4) (pred_12 ?v13) (pred_1 ?v11)
          (pred_6 ?v9 ?v4) (pred_4 ?v13 ?v11)
                   (pred_7 ?v4 ?v11) (pred_11 ?v9) 
                   (pred_5 ?v4) (pred_9 ?v13))
:effect (and  (pred_10 ?v4) (not (pred_5 ?v4))))


(:action op_3
:parameters (?v9 ?v12)
:precondition (and (pred_3 ?v9) (pred_3 ?v12)
               (pred_11 ?v9) (pred_6 ?v9 ?v12) (pred_10 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v9))))

(:action op_2
:parameters (?v9 ?v13)
:precondition (and (pred_3 ?v9) (pred_12 ?v13) 
                  (pred_11 ?v9) (pred_8 ?v13 ?v9) (pred_2 ))
:effect (and (pred_9 ?v13)
   (not (pred_8 ?v13 ?v9)) (not (pred_2 ))))


(:action op_1
:parameters (?v9 ?v5 ?v10)
:precondition (and (pred_3 ?v9) (pred_12 ?v5) (pred_12 ?v10)
                  (pred_11 ?v9) (pred_9 ?v10) (pred_8 ?v5 ?v9))
:effect (and (pred_9 ?v5) (pred_8 ?v10 ?v9)
        (not (pred_9 ?v10)) (not (pred_8 ?v5 ?v9))))

(:action op_5
:parameters (?v9 ?v13)
:precondition (and (pred_3 ?v9) (pred_12 ?v13) 
                  (pred_11 ?v9) (pred_9 ?v13))
:effect (and (pred_2 ) (pred_8 ?v13 ?v9) (not (pred_9 ?v13)))))


	
