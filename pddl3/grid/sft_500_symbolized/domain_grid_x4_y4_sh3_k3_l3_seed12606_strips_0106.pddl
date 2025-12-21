(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v4 ?v3)
             (pred_1 ?v11 ?v5)
             (pred_2 ?v4 ?v5)
             (pred_3 ?v12 ?v4 )
	     (pred_4 ?v4)
             (pred_12 ?v10)
             (pred_10 ?v11)
             (pred_8 ?v5)
             (pred_9 ?v4)
             (pred_5 ?v11)
             (pred_6 ?v4)
             (pred_7 ))



(:action op_5
:parameters (?v9 ?v2 ?v1 ?v6)
:precondition (and (pred_12 ?v9) (pred_12 ?v2) (pred_10 ?v1) (pred_8 ?v6)
          (pred_11 ?v9 ?v2) (pred_1 ?v1 ?v6)
                   (pred_2 ?v2 ?v6) (pred_4 ?v9) 
                   (pred_9 ?v2) (pred_5 ?v1))
:effect (and  (pred_6 ?v2) (not (pred_9 ?v2))))


(:action op_1
:parameters (?v9 ?v13)
:precondition (and (pred_12 ?v9) (pred_12 ?v13)
               (pred_4 ?v9) (pred_11 ?v9 ?v13) (pred_6 ?v13))
:effect (and (pred_4 ?v13) (not (pred_4 ?v9))))

(:action op_3
:parameters (?v9 ?v1)
:precondition (and (pred_12 ?v9) (pred_10 ?v1) 
                  (pred_4 ?v9) (pred_3 ?v1 ?v9) (pred_7 ))
:effect (and (pred_5 ?v1)
   (not (pred_3 ?v1 ?v9)) (not (pred_7 ))))


(:action op_4
:parameters (?v9 ?v8 ?v7)
:precondition (and (pred_12 ?v9) (pred_10 ?v8) (pred_10 ?v7)
                  (pred_4 ?v9) (pred_5 ?v7) (pred_3 ?v8 ?v9))
:effect (and (pred_5 ?v8) (pred_3 ?v7 ?v9)
        (not (pred_5 ?v7)) (not (pred_3 ?v8 ?v9))))

(:action op_2
:parameters (?v9 ?v1)
:precondition (and (pred_12 ?v9) (pred_10 ?v1) 
                  (pred_4 ?v9) (pred_5 ?v1))
:effect (and (pred_7 ) (pred_3 ?v1 ?v9) (not (pred_5 ?v1)))))


	
