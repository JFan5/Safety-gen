(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v12 ?v8)
             (pred_8 ?v7 ?v4)
             (pred_7 ?v12 ?v4)
             (pred_5 ?v10 ?v12 )
	     (pred_6 ?v12)
             (pred_10 ?v6)
             (pred_12 ?v7)
             (pred_2 ?v4)
             (pred_11 ?v12)
             (pred_9 ?v7)
             (pred_1 ?v12)
             (pred_4 ))



(:action op_2
:parameters (?v5 ?v1 ?v9 ?v2)
:precondition (and (pred_10 ?v5) (pred_10 ?v1) (pred_12 ?v9) (pred_2 ?v2)
          (pred_3 ?v5 ?v1) (pred_8 ?v9 ?v2)
                   (pred_7 ?v1 ?v2) (pred_6 ?v5) 
                   (pred_11 ?v1) (pred_9 ?v9))
:effect (and  (pred_1 ?v1) (not (pred_11 ?v1))))


(:action op_1
:parameters (?v5 ?v3)
:precondition (and (pred_10 ?v5) (pred_10 ?v3)
               (pred_6 ?v5) (pred_3 ?v5 ?v3) (pred_1 ?v3))
:effect (and (pred_6 ?v3) (not (pred_6 ?v5))))

(:action op_4
:parameters (?v5 ?v9)
:precondition (and (pred_10 ?v5) (pred_12 ?v9) 
                  (pred_6 ?v5) (pred_5 ?v9 ?v5) (pred_4 ))
:effect (and (pred_9 ?v9)
   (not (pred_5 ?v9 ?v5)) (not (pred_4 ))))


(:action op_3
:parameters (?v5 ?v11 ?v13)
:precondition (and (pred_10 ?v5) (pred_12 ?v11) (pred_12 ?v13)
                  (pred_6 ?v5) (pred_9 ?v13) (pred_5 ?v11 ?v5))
:effect (and (pred_9 ?v11) (pred_5 ?v13 ?v5)
        (not (pred_9 ?v13)) (not (pred_5 ?v11 ?v5))))

(:action op_5
:parameters (?v5 ?v9)
:precondition (and (pred_10 ?v5) (pred_12 ?v9) 
                  (pred_6 ?v5) (pred_9 ?v9))
:effect (and (pred_4 ) (pred_5 ?v9 ?v5) (not (pred_9 ?v9)))))


	
