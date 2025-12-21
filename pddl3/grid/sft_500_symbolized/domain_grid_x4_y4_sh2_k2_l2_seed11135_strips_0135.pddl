(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v3 ?v11)
             (pred_2 ?v10 ?v2)
             (pred_6 ?v3 ?v2)
             (pred_1 ?v7 ?v3 )
	     (pred_5 ?v3)
             (pred_3 ?v9)
             (pred_8 ?v10)
             (pred_12 ?v2)
             (pred_10 ?v3)
             (pred_9 ?v10)
             (pred_4 ?v3)
             (pred_7 ))



(:action op_3
:parameters (?v5 ?v1 ?v6 ?v12)
:precondition (and (pred_3 ?v5) (pred_3 ?v1) (pred_8 ?v6) (pred_12 ?v12)
          (pred_11 ?v5 ?v1) (pred_2 ?v6 ?v12)
                   (pred_6 ?v1 ?v12) (pred_5 ?v5) 
                   (pred_10 ?v1) (pred_9 ?v6))
:effect (and  (pred_4 ?v1) (not (pred_10 ?v1))))


(:action op_5
:parameters (?v5 ?v13)
:precondition (and (pred_3 ?v5) (pred_3 ?v13)
               (pred_5 ?v5) (pred_11 ?v5 ?v13) (pred_4 ?v13))
:effect (and (pred_5 ?v13) (not (pred_5 ?v5))))

(:action op_1
:parameters (?v5 ?v6)
:precondition (and (pred_3 ?v5) (pred_8 ?v6) 
                  (pred_5 ?v5) (pred_1 ?v6 ?v5) (pred_7 ))
:effect (and (pred_9 ?v6)
   (not (pred_1 ?v6 ?v5)) (not (pred_7 ))))


(:action op_4
:parameters (?v5 ?v4 ?v8)
:precondition (and (pred_3 ?v5) (pred_8 ?v4) (pred_8 ?v8)
                  (pred_5 ?v5) (pred_9 ?v8) (pred_1 ?v4 ?v5))
:effect (and (pred_9 ?v4) (pred_1 ?v8 ?v5)
        (not (pred_9 ?v8)) (not (pred_1 ?v4 ?v5))))

(:action op_2
:parameters (?v5 ?v6)
:precondition (and (pred_3 ?v5) (pred_8 ?v6) 
                  (pred_5 ?v5) (pred_9 ?v6))
:effect (and (pred_7 ) (pred_1 ?v6 ?v5) (not (pred_9 ?v6)))))


	
