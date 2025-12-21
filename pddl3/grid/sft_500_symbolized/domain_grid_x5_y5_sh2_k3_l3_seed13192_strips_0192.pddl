(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v4 ?v12)
             (pred_8 ?v11 ?v10)
             (pred_4 ?v4 ?v10)
             (pred_1 ?v6 ?v4 )
	     (pred_5 ?v4)
             (pred_9 ?v1)
             (pred_10 ?v11)
             (pred_12 ?v10)
             (pred_6 ?v4)
             (pred_7 ?v11)
             (pred_2 ?v4)
             (pred_3 ))



(:action op_2
:parameters (?v5 ?v2 ?v8 ?v3)
:precondition (and (pred_9 ?v5) (pred_9 ?v2) (pred_10 ?v8) (pred_12 ?v3)
          (pred_11 ?v5 ?v2) (pred_8 ?v8 ?v3)
                   (pred_4 ?v2 ?v3) (pred_5 ?v5) 
                   (pred_6 ?v2) (pred_7 ?v8))
:effect (and  (pred_2 ?v2) (not (pred_6 ?v2))))


(:action op_4
:parameters (?v5 ?v7)
:precondition (and (pred_9 ?v5) (pred_9 ?v7)
               (pred_5 ?v5) (pred_11 ?v5 ?v7) (pred_2 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v5))))

(:action op_3
:parameters (?v5 ?v8)
:precondition (and (pred_9 ?v5) (pred_10 ?v8) 
                  (pred_5 ?v5) (pred_1 ?v8 ?v5) (pred_3 ))
:effect (and (pred_7 ?v8)
   (not (pred_1 ?v8 ?v5)) (not (pred_3 ))))


(:action op_1
:parameters (?v5 ?v9 ?v13)
:precondition (and (pred_9 ?v5) (pred_10 ?v9) (pred_10 ?v13)
                  (pred_5 ?v5) (pred_7 ?v13) (pred_1 ?v9 ?v5))
:effect (and (pred_7 ?v9) (pred_1 ?v13 ?v5)
        (not (pred_7 ?v13)) (not (pred_1 ?v9 ?v5))))

(:action op_5
:parameters (?v5 ?v8)
:precondition (and (pred_9 ?v5) (pred_10 ?v8) 
                  (pred_5 ?v5) (pred_7 ?v8))
:effect (and (pred_3 ) (pred_1 ?v8 ?v5) (not (pred_7 ?v8)))))


	
