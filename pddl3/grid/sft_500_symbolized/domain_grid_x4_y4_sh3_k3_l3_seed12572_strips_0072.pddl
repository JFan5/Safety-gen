(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v2 ?v9)
             (pred_12 ?v3 ?v13)
             (pred_5 ?v2 ?v13)
             (pred_10 ?v8 ?v2 )
	     (pred_1 ?v2)
             (pred_8 ?v12)
             (pred_11 ?v3)
             (pred_3 ?v13)
             (pred_4 ?v2)
             (pred_9 ?v3)
             (pred_7 ?v2)
             (pred_6 ))



(:action op_5
:parameters (?v5 ?v1 ?v10 ?v7)
:precondition (and (pred_8 ?v5) (pred_8 ?v1) (pred_11 ?v10) (pred_3 ?v7)
          (pred_2 ?v5 ?v1) (pred_12 ?v10 ?v7)
                   (pred_5 ?v1 ?v7) (pred_1 ?v5) 
                   (pred_4 ?v1) (pred_9 ?v10))
:effect (and  (pred_7 ?v1) (not (pred_4 ?v1))))


(:action op_1
:parameters (?v5 ?v6)
:precondition (and (pred_8 ?v5) (pred_8 ?v6)
               (pred_1 ?v5) (pred_2 ?v5 ?v6) (pred_7 ?v6))
:effect (and (pred_1 ?v6) (not (pred_1 ?v5))))

(:action op_3
:parameters (?v5 ?v10)
:precondition (and (pred_8 ?v5) (pred_11 ?v10) 
                  (pred_1 ?v5) (pred_10 ?v10 ?v5) (pred_6 ))
:effect (and (pred_9 ?v10)
   (not (pred_10 ?v10 ?v5)) (not (pred_6 ))))


(:action op_2
:parameters (?v5 ?v11 ?v4)
:precondition (and (pred_8 ?v5) (pred_11 ?v11) (pred_11 ?v4)
                  (pred_1 ?v5) (pred_9 ?v4) (pred_10 ?v11 ?v5))
:effect (and (pred_9 ?v11) (pred_10 ?v4 ?v5)
        (not (pred_9 ?v4)) (not (pred_10 ?v11 ?v5))))

(:action op_4
:parameters (?v5 ?v10)
:precondition (and (pred_8 ?v5) (pred_11 ?v10) 
                  (pred_1 ?v5) (pred_9 ?v10))
:effect (and (pred_6 ) (pred_10 ?v10 ?v5) (not (pred_9 ?v10)))))


	
