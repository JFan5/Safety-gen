(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v10 ?v3)
             (pred_3 ?v2 ?v11)
             (pred_9 ?v10 ?v11)
             (pred_5 ?v7 ?v10 )
	     (pred_8 ?v10)
             (pred_7 ?v8)
             (pred_12 ?v2)
             (pred_2 ?v11)
             (pred_11 ?v10)
             (pred_6 ?v2)
             (pred_10 ?v10)
             (pred_1 ))



(:action op_1
:parameters (?v4 ?v9 ?v13 ?v12)
:precondition (and (pred_7 ?v4) (pred_7 ?v9) (pred_12 ?v13) (pred_2 ?v12)
          (pred_4 ?v4 ?v9) (pred_3 ?v13 ?v12)
                   (pred_9 ?v9 ?v12) (pred_8 ?v4) 
                   (pred_11 ?v9) (pred_6 ?v13))
:effect (and  (pred_10 ?v9) (not (pred_11 ?v9))))


(:action op_3
:parameters (?v4 ?v1)
:precondition (and (pred_7 ?v4) (pred_7 ?v1)
               (pred_8 ?v4) (pred_4 ?v4 ?v1) (pred_10 ?v1))
:effect (and (pred_8 ?v1) (not (pred_8 ?v4))))

(:action op_5
:parameters (?v4 ?v13)
:precondition (and (pred_7 ?v4) (pred_12 ?v13) 
                  (pred_8 ?v4) (pred_5 ?v13 ?v4) (pred_1 ))
:effect (and (pred_6 ?v13)
   (not (pred_5 ?v13 ?v4)) (not (pred_1 ))))


(:action op_2
:parameters (?v4 ?v6 ?v5)
:precondition (and (pred_7 ?v4) (pred_12 ?v6) (pred_12 ?v5)
                  (pred_8 ?v4) (pred_6 ?v5) (pred_5 ?v6 ?v4))
:effect (and (pred_6 ?v6) (pred_5 ?v5 ?v4)
        (not (pred_6 ?v5)) (not (pred_5 ?v6 ?v4))))

(:action op_4
:parameters (?v4 ?v13)
:precondition (and (pred_7 ?v4) (pred_12 ?v13) 
                  (pred_8 ?v4) (pred_6 ?v13))
:effect (and (pred_1 ) (pred_5 ?v13 ?v4) (not (pred_6 ?v13)))))


	
