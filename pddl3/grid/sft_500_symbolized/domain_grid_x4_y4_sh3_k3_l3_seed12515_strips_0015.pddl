(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v8 ?v10)
             (pred_7 ?v12 ?v6)
             (pred_4 ?v8 ?v6)
             (pred_12 ?v3 ?v8 )
	     (pred_6 ?v8)
             (pred_3 ?v5)
             (pred_9 ?v12)
             (pred_8 ?v6)
             (pred_5 ?v8)
             (pred_11 ?v12)
             (pred_2 ?v8)
             (pred_10 ))



(:action op_2
:parameters (?v9 ?v2 ?v7 ?v11)
:precondition (and (pred_3 ?v9) (pred_3 ?v2) (pred_9 ?v7) (pred_8 ?v11)
          (pred_1 ?v9 ?v2) (pred_7 ?v7 ?v11)
                   (pred_4 ?v2 ?v11) (pred_6 ?v9) 
                   (pred_5 ?v2) (pred_11 ?v7))
:effect (and  (pred_2 ?v2) (not (pred_5 ?v2))))


(:action op_1
:parameters (?v9 ?v13)
:precondition (and (pred_3 ?v9) (pred_3 ?v13)
               (pred_6 ?v9) (pred_1 ?v9 ?v13) (pred_2 ?v13))
:effect (and (pred_6 ?v13) (not (pred_6 ?v9))))

(:action op_3
:parameters (?v9 ?v7)
:precondition (and (pred_3 ?v9) (pred_9 ?v7) 
                  (pred_6 ?v9) (pred_12 ?v7 ?v9) (pred_10 ))
:effect (and (pred_11 ?v7)
   (not (pred_12 ?v7 ?v9)) (not (pred_10 ))))


(:action op_4
:parameters (?v9 ?v4 ?v1)
:precondition (and (pred_3 ?v9) (pred_9 ?v4) (pred_9 ?v1)
                  (pred_6 ?v9) (pred_11 ?v1) (pred_12 ?v4 ?v9))
:effect (and (pred_11 ?v4) (pred_12 ?v1 ?v9)
        (not (pred_11 ?v1)) (not (pred_12 ?v4 ?v9))))

(:action op_5
:parameters (?v9 ?v7)
:precondition (and (pred_3 ?v9) (pred_9 ?v7) 
                  (pred_6 ?v9) (pred_11 ?v7))
:effect (and (pred_10 ) (pred_12 ?v7 ?v9) (not (pred_11 ?v7)))))


	
