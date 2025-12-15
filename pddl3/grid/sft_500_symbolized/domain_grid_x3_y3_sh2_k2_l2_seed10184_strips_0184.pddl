(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v4 ?v11)
             (pred_10 ?v13 ?v2)
             (pred_6 ?v4 ?v2)
             (pred_5 ?v10 ?v4 )
	     (pred_2 ?v4)
             (pred_3 ?v12)
             (pred_9 ?v13)
             (pred_1 ?v2)
             (pred_11 ?v4)
             (pred_7 ?v13)
             (pred_4 ?v4)
             (pred_8 ))



(:action op_1
:parameters (?v1 ?v5 ?v9 ?v7)
:precondition (and (pred_3 ?v1) (pred_3 ?v5) (pred_9 ?v9) (pred_1 ?v7)
          (pred_12 ?v1 ?v5) (pred_10 ?v9 ?v7)
                   (pred_6 ?v5 ?v7) (pred_2 ?v1) 
                   (pred_11 ?v5) (pred_7 ?v9))
:effect (and  (pred_4 ?v5) (not (pred_11 ?v5))))


(:action op_5
:parameters (?v1 ?v6)
:precondition (and (pred_3 ?v1) (pred_3 ?v6)
               (pred_2 ?v1) (pred_12 ?v1 ?v6) (pred_4 ?v6))
:effect (and (pred_2 ?v6) (not (pred_2 ?v1))))

(:action op_2
:parameters (?v1 ?v9)
:precondition (and (pred_3 ?v1) (pred_9 ?v9) 
                  (pred_2 ?v1) (pred_5 ?v9 ?v1) (pred_8 ))
:effect (and (pred_7 ?v9)
   (not (pred_5 ?v9 ?v1)) (not (pred_8 ))))


(:action op_4
:parameters (?v1 ?v3 ?v8)
:precondition (and (pred_3 ?v1) (pred_9 ?v3) (pred_9 ?v8)
                  (pred_2 ?v1) (pred_7 ?v8) (pred_5 ?v3 ?v1))
:effect (and (pred_7 ?v3) (pred_5 ?v8 ?v1)
        (not (pred_7 ?v8)) (not (pred_5 ?v3 ?v1))))

(:action op_3
:parameters (?v1 ?v9)
:precondition (and (pred_3 ?v1) (pred_9 ?v9) 
                  (pred_2 ?v1) (pred_7 ?v9))
:effect (and (pred_8 ) (pred_5 ?v9 ?v1) (not (pred_7 ?v9)))))


	
