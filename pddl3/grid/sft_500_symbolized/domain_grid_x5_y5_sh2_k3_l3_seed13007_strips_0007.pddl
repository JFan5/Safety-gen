(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v4 ?v2)
             (pred_6 ?v11 ?v10)
             (pred_4 ?v4 ?v10)
             (pred_9 ?v5 ?v4 )
	     (pred_3 ?v4)
             (pred_5 ?v8)
             (pred_10 ?v11)
             (pred_12 ?v10)
             (pred_7 ?v4)
             (pred_8 ?v11)
             (pred_2 ?v4)
             (pred_1 ))



(:action op_5
:parameters (?v9 ?v3 ?v13 ?v1)
:precondition (and (pred_5 ?v9) (pred_5 ?v3) (pred_10 ?v13) (pred_12 ?v1)
          (pred_11 ?v9 ?v3) (pred_6 ?v13 ?v1)
                   (pred_4 ?v3 ?v1) (pred_3 ?v9) 
                   (pred_7 ?v3) (pred_8 ?v13))
:effect (and  (pred_2 ?v3) (not (pred_7 ?v3))))


(:action op_3
:parameters (?v9 ?v12)
:precondition (and (pred_5 ?v9) (pred_5 ?v12)
               (pred_3 ?v9) (pred_11 ?v9 ?v12) (pred_2 ?v12))
:effect (and (pred_3 ?v12) (not (pred_3 ?v9))))

(:action op_1
:parameters (?v9 ?v13)
:precondition (and (pred_5 ?v9) (pred_10 ?v13) 
                  (pred_3 ?v9) (pred_9 ?v13 ?v9) (pred_1 ))
:effect (and (pred_8 ?v13)
   (not (pred_9 ?v13 ?v9)) (not (pred_1 ))))


(:action op_2
:parameters (?v9 ?v6 ?v7)
:precondition (and (pred_5 ?v9) (pred_10 ?v6) (pred_10 ?v7)
                  (pred_3 ?v9) (pred_8 ?v7) (pred_9 ?v6 ?v9))
:effect (and (pred_8 ?v6) (pred_9 ?v7 ?v9)
        (not (pred_8 ?v7)) (not (pred_9 ?v6 ?v9))))

(:action op_4
:parameters (?v9 ?v13)
:precondition (and (pred_5 ?v9) (pred_10 ?v13) 
                  (pred_3 ?v9) (pred_8 ?v13))
:effect (and (pred_1 ) (pred_9 ?v13 ?v9) (not (pred_8 ?v13)))))


	
