(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v4 ?v3)
             (pred_2 ?v6 ?v1)
             (pred_8 ?v4 ?v1)
             (pred_11 ?v11 ?v4 )
	     (pred_12 ?v4)
             (pred_7 ?v2)
             (pred_6 ?v6)
             (pred_4 ?v1)
             (pred_3 ?v4)
             (pred_10 ?v6)
             (pred_1 ?v4)
             (pred_5 ))



(:action op_3
:parameters (?v5 ?v7 ?v8 ?v12)
:precondition (and (pred_7 ?v5) (pred_7 ?v7) (pred_6 ?v8) (pred_4 ?v12)
          (pred_9 ?v5 ?v7) (pred_2 ?v8 ?v12)
                   (pred_8 ?v7 ?v12) (pred_12 ?v5) 
                   (pred_3 ?v7) (pred_10 ?v8))
:effect (and  (pred_1 ?v7) (not (pred_3 ?v7))))


(:action op_1
:parameters (?v5 ?v13)
:precondition (and (pred_7 ?v5) (pred_7 ?v13)
               (pred_12 ?v5) (pred_9 ?v5 ?v13) (pred_1 ?v13))
:effect (and (pred_12 ?v13) (not (pred_12 ?v5))))

(:action op_5
:parameters (?v5 ?v8)
:precondition (and (pred_7 ?v5) (pred_6 ?v8) 
                  (pred_12 ?v5) (pred_11 ?v8 ?v5) (pred_5 ))
:effect (and (pred_10 ?v8)
   (not (pred_11 ?v8 ?v5)) (not (pred_5 ))))


(:action op_4
:parameters (?v5 ?v9 ?v10)
:precondition (and (pred_7 ?v5) (pred_6 ?v9) (pred_6 ?v10)
                  (pred_12 ?v5) (pred_10 ?v10) (pred_11 ?v9 ?v5))
:effect (and (pred_10 ?v9) (pred_11 ?v10 ?v5)
        (not (pred_10 ?v10)) (not (pred_11 ?v9 ?v5))))

(:action op_2
:parameters (?v5 ?v8)
:precondition (and (pred_7 ?v5) (pred_6 ?v8) 
                  (pred_12 ?v5) (pred_10 ?v8))
:effect (and (pred_5 ) (pred_11 ?v8 ?v5) (not (pred_10 ?v8)))))


	
