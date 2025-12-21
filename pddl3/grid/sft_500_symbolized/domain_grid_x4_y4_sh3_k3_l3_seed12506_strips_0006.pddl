(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v6 ?v13)
             (pred_5 ?v12 ?v7)
             (pred_1 ?v6 ?v7)
             (pred_3 ?v11 ?v6 )
	     (pred_6 ?v6)
             (pred_9 ?v10)
             (pred_12 ?v12)
             (pred_11 ?v7)
             (pred_7 ?v6)
             (pred_2 ?v12)
             (pred_10 ?v6)
             (pred_4 ))



(:action op_2
:parameters (?v1 ?v5 ?v9 ?v3)
:precondition (and (pred_9 ?v1) (pred_9 ?v5) (pred_12 ?v9) (pred_11 ?v3)
          (pred_8 ?v1 ?v5) (pred_5 ?v9 ?v3)
                   (pred_1 ?v5 ?v3) (pred_6 ?v1) 
                   (pred_7 ?v5) (pred_2 ?v9))
:effect (and  (pred_10 ?v5) (not (pred_7 ?v5))))


(:action op_4
:parameters (?v1 ?v2)
:precondition (and (pred_9 ?v1) (pred_9 ?v2)
               (pred_6 ?v1) (pred_8 ?v1 ?v2) (pred_10 ?v2))
:effect (and (pred_6 ?v2) (not (pred_6 ?v1))))

(:action op_5
:parameters (?v1 ?v9)
:precondition (and (pred_9 ?v1) (pred_12 ?v9) 
                  (pred_6 ?v1) (pred_3 ?v9 ?v1) (pred_4 ))
:effect (and (pred_2 ?v9)
   (not (pred_3 ?v9 ?v1)) (not (pred_4 ))))


(:action op_3
:parameters (?v1 ?v8 ?v4)
:precondition (and (pred_9 ?v1) (pred_12 ?v8) (pred_12 ?v4)
                  (pred_6 ?v1) (pred_2 ?v4) (pred_3 ?v8 ?v1))
:effect (and (pred_2 ?v8) (pred_3 ?v4 ?v1)
        (not (pred_2 ?v4)) (not (pred_3 ?v8 ?v1))))

(:action op_1
:parameters (?v1 ?v9)
:precondition (and (pred_9 ?v1) (pred_12 ?v9) 
                  (pred_6 ?v1) (pred_2 ?v9))
:effect (and (pred_4 ) (pred_3 ?v9 ?v1) (not (pred_2 ?v9)))))


	
