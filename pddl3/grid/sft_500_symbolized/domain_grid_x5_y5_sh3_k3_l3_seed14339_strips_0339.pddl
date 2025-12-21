(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v6 ?v11)
             (pred_5 ?v13 ?v7)
             (pred_7 ?v6 ?v7)
             (pred_3 ?v1 ?v6 )
	     (pred_9 ?v6)
             (pred_12 ?v12)
             (pred_4 ?v13)
             (pred_10 ?v7)
             (pred_2 ?v6)
             (pred_6 ?v13)
             (pred_1 ?v6)
             (pred_11 ))



(:action op_3
:parameters (?v5 ?v8 ?v9 ?v10)
:precondition (and (pred_12 ?v5) (pred_12 ?v8) (pred_4 ?v9) (pred_10 ?v10)
          (pred_8 ?v5 ?v8) (pred_5 ?v9 ?v10)
                   (pred_7 ?v8 ?v10) (pred_9 ?v5) 
                   (pred_2 ?v8) (pred_6 ?v9))
:effect (and  (pred_1 ?v8) (not (pred_2 ?v8))))


(:action op_1
:parameters (?v5 ?v2)
:precondition (and (pred_12 ?v5) (pred_12 ?v2)
               (pred_9 ?v5) (pred_8 ?v5 ?v2) (pred_1 ?v2))
:effect (and (pred_9 ?v2) (not (pred_9 ?v5))))

(:action op_2
:parameters (?v5 ?v9)
:precondition (and (pred_12 ?v5) (pred_4 ?v9) 
                  (pred_9 ?v5) (pred_3 ?v9 ?v5) (pred_11 ))
:effect (and (pred_6 ?v9)
   (not (pred_3 ?v9 ?v5)) (not (pred_11 ))))


(:action op_5
:parameters (?v5 ?v4 ?v3)
:precondition (and (pred_12 ?v5) (pred_4 ?v4) (pred_4 ?v3)
                  (pred_9 ?v5) (pred_6 ?v3) (pred_3 ?v4 ?v5))
:effect (and (pred_6 ?v4) (pred_3 ?v3 ?v5)
        (not (pred_6 ?v3)) (not (pred_3 ?v4 ?v5))))

(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_12 ?v5) (pred_4 ?v9) 
                  (pred_9 ?v5) (pred_6 ?v9))
:effect (and (pred_11 ) (pred_3 ?v9 ?v5) (not (pred_6 ?v9)))))


	
