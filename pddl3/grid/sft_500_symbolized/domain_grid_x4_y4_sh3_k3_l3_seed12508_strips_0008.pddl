(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v6 ?v11)
             (pred_10 ?v4 ?v10)
             (pred_8 ?v6 ?v10)
             (pred_7 ?v8 ?v6 )
	     (pred_4 ?v6)
             (pred_9 ?v7)
             (pred_2 ?v4)
             (pred_12 ?v10)
             (pred_1 ?v6)
             (pred_3 ?v4)
             (pred_11 ?v6)
             (pred_5 ))



(:action op_5
:parameters (?v9 ?v5 ?v3 ?v13)
:precondition (and (pred_9 ?v9) (pred_9 ?v5) (pred_2 ?v3) (pred_12 ?v13)
          (pred_6 ?v9 ?v5) (pred_10 ?v3 ?v13)
                   (pred_8 ?v5 ?v13) (pred_4 ?v9) 
                   (pred_1 ?v5) (pred_3 ?v3))
:effect (and  (pred_11 ?v5) (not (pred_1 ?v5))))


(:action op_3
:parameters (?v9 ?v12)
:precondition (and (pred_9 ?v9) (pred_9 ?v12)
               (pred_4 ?v9) (pred_6 ?v9 ?v12) (pred_11 ?v12))
:effect (and (pred_4 ?v12) (not (pred_4 ?v9))))

(:action op_4
:parameters (?v9 ?v3)
:precondition (and (pred_9 ?v9) (pred_2 ?v3) 
                  (pred_4 ?v9) (pred_7 ?v3 ?v9) (pred_5 ))
:effect (and (pred_3 ?v3)
   (not (pred_7 ?v3 ?v9)) (not (pred_5 ))))


(:action op_1
:parameters (?v9 ?v2 ?v1)
:precondition (and (pred_9 ?v9) (pred_2 ?v2) (pred_2 ?v1)
                  (pred_4 ?v9) (pred_3 ?v1) (pred_7 ?v2 ?v9))
:effect (and (pred_3 ?v2) (pred_7 ?v1 ?v9)
        (not (pred_3 ?v1)) (not (pred_7 ?v2 ?v9))))

(:action op_2
:parameters (?v9 ?v3)
:precondition (and (pred_9 ?v9) (pred_2 ?v3) 
                  (pred_4 ?v9) (pred_3 ?v3))
:effect (and (pred_5 ) (pred_7 ?v3 ?v9) (not (pred_3 ?v3)))))


	
