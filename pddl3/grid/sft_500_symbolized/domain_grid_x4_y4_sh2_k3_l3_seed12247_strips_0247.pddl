(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v6 ?v7)
             (pred_12 ?v8 ?v12)
             (pred_6 ?v6 ?v12)
             (pred_5 ?v1 ?v6 )
	     (pred_9 ?v6)
             (pred_4 ?v10)
             (pred_10 ?v8)
             (pred_3 ?v12)
             (pred_1 ?v6)
             (pred_11 ?v8)
             (pred_2 ?v6)
             (pred_7 ))



(:action op_1
:parameters (?v4 ?v9 ?v5 ?v3)
:precondition (and (pred_4 ?v4) (pred_4 ?v9) (pred_10 ?v5) (pred_3 ?v3)
          (pred_8 ?v4 ?v9) (pred_12 ?v5 ?v3)
                   (pred_6 ?v9 ?v3) (pred_9 ?v4) 
                   (pred_1 ?v9) (pred_11 ?v5))
:effect (and  (pred_2 ?v9) (not (pred_1 ?v9))))


(:action op_2
:parameters (?v4 ?v2)
:precondition (and (pred_4 ?v4) (pred_4 ?v2)
               (pred_9 ?v4) (pred_8 ?v4 ?v2) (pred_2 ?v2))
:effect (and (pred_9 ?v2) (not (pred_9 ?v4))))

(:action op_5
:parameters (?v4 ?v5)
:precondition (and (pred_4 ?v4) (pred_10 ?v5) 
                  (pred_9 ?v4) (pred_5 ?v5 ?v4) (pred_7 ))
:effect (and (pred_11 ?v5)
   (not (pred_5 ?v5 ?v4)) (not (pred_7 ))))


(:action op_4
:parameters (?v4 ?v11 ?v13)
:precondition (and (pred_4 ?v4) (pred_10 ?v11) (pred_10 ?v13)
                  (pred_9 ?v4) (pred_11 ?v13) (pred_5 ?v11 ?v4))
:effect (and (pred_11 ?v11) (pred_5 ?v13 ?v4)
        (not (pred_11 ?v13)) (not (pred_5 ?v11 ?v4))))

(:action op_3
:parameters (?v4 ?v5)
:precondition (and (pred_4 ?v4) (pred_10 ?v5) 
                  (pred_9 ?v4) (pred_11 ?v5))
:effect (and (pred_7 ) (pred_5 ?v5 ?v4) (not (pred_11 ?v5)))))


	
