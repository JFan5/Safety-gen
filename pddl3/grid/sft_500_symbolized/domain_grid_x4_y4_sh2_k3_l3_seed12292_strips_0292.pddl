(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v11 ?v1)
             (pred_1 ?v6 ?v10)
             (pred_10 ?v11 ?v10)
             (pred_12 ?v7 ?v11 )
	     (pred_11 ?v11)
             (pred_8 ?v12)
             (pred_9 ?v6)
             (pred_2 ?v10)
             (pred_3 ?v11)
             (pred_5 ?v6)
             (pred_6 ?v11)
             (pred_4 ))



(:action op_1
:parameters (?v5 ?v9 ?v3 ?v2)
:precondition (and (pred_8 ?v5) (pred_8 ?v9) (pred_9 ?v3) (pred_2 ?v2)
          (pred_7 ?v5 ?v9) (pred_1 ?v3 ?v2)
                   (pred_10 ?v9 ?v2) (pred_11 ?v5) 
                   (pred_3 ?v9) (pred_5 ?v3))
:effect (and  (pred_6 ?v9) (not (pred_3 ?v9))))


(:action op_2
:parameters (?v5 ?v13)
:precondition (and (pred_8 ?v5) (pred_8 ?v13)
               (pred_11 ?v5) (pred_7 ?v5 ?v13) (pred_6 ?v13))
:effect (and (pred_11 ?v13) (not (pred_11 ?v5))))

(:action op_4
:parameters (?v5 ?v3)
:precondition (and (pred_8 ?v5) (pred_9 ?v3) 
                  (pred_11 ?v5) (pred_12 ?v3 ?v5) (pred_4 ))
:effect (and (pred_5 ?v3)
   (not (pred_12 ?v3 ?v5)) (not (pred_4 ))))


(:action op_5
:parameters (?v5 ?v8 ?v4)
:precondition (and (pred_8 ?v5) (pred_9 ?v8) (pred_9 ?v4)
                  (pred_11 ?v5) (pred_5 ?v4) (pred_12 ?v8 ?v5))
:effect (and (pred_5 ?v8) (pred_12 ?v4 ?v5)
        (not (pred_5 ?v4)) (not (pred_12 ?v8 ?v5))))

(:action op_3
:parameters (?v5 ?v3)
:precondition (and (pred_8 ?v5) (pred_9 ?v3) 
                  (pred_11 ?v5) (pred_5 ?v3))
:effect (and (pred_4 ) (pred_12 ?v3 ?v5) (not (pred_5 ?v3)))))


	
