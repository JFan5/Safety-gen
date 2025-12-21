(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v8 ?v12)
             (pred_11 ?v2 ?v13)
             (pred_12 ?v8 ?v13)
             (pred_5 ?v6 ?v8 )
	     (pred_10 ?v8)
             (pred_2 ?v11)
             (pred_1 ?v2)
             (pred_3 ?v13)
             (pred_7 ?v8)
             (pred_8 ?v2)
             (pred_4 ?v8)
             (pred_6 ))



(:action op_5
:parameters (?v9 ?v4 ?v5 ?v10)
:precondition (and (pred_2 ?v9) (pred_2 ?v4) (pred_1 ?v5) (pred_3 ?v10)
          (pred_9 ?v9 ?v4) (pred_11 ?v5 ?v10)
                   (pred_12 ?v4 ?v10) (pred_10 ?v9) 
                   (pred_7 ?v4) (pred_8 ?v5))
:effect (and  (pred_4 ?v4) (not (pred_7 ?v4))))


(:action op_3
:parameters (?v9 ?v7)
:precondition (and (pred_2 ?v9) (pred_2 ?v7)
               (pred_10 ?v9) (pred_9 ?v9 ?v7) (pred_4 ?v7))
:effect (and (pred_10 ?v7) (not (pred_10 ?v9))))

(:action op_1
:parameters (?v9 ?v5)
:precondition (and (pred_2 ?v9) (pred_1 ?v5) 
                  (pred_10 ?v9) (pred_5 ?v5 ?v9) (pred_6 ))
:effect (and (pred_8 ?v5)
   (not (pred_5 ?v5 ?v9)) (not (pred_6 ))))


(:action op_2
:parameters (?v9 ?v3 ?v1)
:precondition (and (pred_2 ?v9) (pred_1 ?v3) (pred_1 ?v1)
                  (pred_10 ?v9) (pred_8 ?v1) (pred_5 ?v3 ?v9))
:effect (and (pred_8 ?v3) (pred_5 ?v1 ?v9)
        (not (pred_8 ?v1)) (not (pred_5 ?v3 ?v9))))

(:action op_4
:parameters (?v9 ?v5)
:precondition (and (pred_2 ?v9) (pred_1 ?v5) 
                  (pred_10 ?v9) (pred_8 ?v5))
:effect (and (pred_6 ) (pred_5 ?v5 ?v9) (not (pred_8 ?v5)))))


	
