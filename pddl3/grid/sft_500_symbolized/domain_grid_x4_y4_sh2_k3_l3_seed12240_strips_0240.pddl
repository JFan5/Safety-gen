(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v7 ?v1)
             (pred_11 ?v6 ?v4)
             (pred_4 ?v7 ?v4)
             (pred_7 ?v3 ?v7 )
	     (pred_9 ?v7)
             (pred_2 ?v2)
             (pred_5 ?v6)
             (pred_6 ?v4)
             (pred_3 ?v7)
             (pred_8 ?v6)
             (pred_10 ?v7)
             (pred_12 ))



(:action op_1
:parameters (?v5 ?v9 ?v10 ?v8)
:precondition (and (pred_2 ?v5) (pred_2 ?v9) (pred_5 ?v10) (pred_6 ?v8)
          (pred_1 ?v5 ?v9) (pred_11 ?v10 ?v8)
                   (pred_4 ?v9 ?v8) (pred_9 ?v5) 
                   (pred_3 ?v9) (pred_8 ?v10))
:effect (and  (pred_10 ?v9) (not (pred_3 ?v9))))


(:action op_3
:parameters (?v5 ?v11)
:precondition (and (pred_2 ?v5) (pred_2 ?v11)
               (pred_9 ?v5) (pred_1 ?v5 ?v11) (pred_10 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v5))))

(:action op_4
:parameters (?v5 ?v10)
:precondition (and (pred_2 ?v5) (pred_5 ?v10) 
                  (pred_9 ?v5) (pred_7 ?v10 ?v5) (pred_12 ))
:effect (and (pred_8 ?v10)
   (not (pred_7 ?v10 ?v5)) (not (pred_12 ))))


(:action op_2
:parameters (?v5 ?v12 ?v13)
:precondition (and (pred_2 ?v5) (pred_5 ?v12) (pred_5 ?v13)
                  (pred_9 ?v5) (pred_8 ?v13) (pred_7 ?v12 ?v5))
:effect (and (pred_8 ?v12) (pred_7 ?v13 ?v5)
        (not (pred_8 ?v13)) (not (pred_7 ?v12 ?v5))))

(:action op_5
:parameters (?v5 ?v10)
:precondition (and (pred_2 ?v5) (pred_5 ?v10) 
                  (pred_9 ?v5) (pred_8 ?v10))
:effect (and (pred_12 ) (pred_7 ?v10 ?v5) (not (pred_8 ?v10)))))


	
