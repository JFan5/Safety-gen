(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v1)
             (pred_4 ?v13 ?v3)
             (pred_8 ?v5 ?v3)
             (pred_5 ?v11 ?v5 )
	     (pred_3 ?v5)
             (pred_1 ?v12)
             (pred_12 ?v13)
             (pred_2 ?v3)
             (pred_6 ?v5)
             (pred_11 ?v13)
             (pred_10 ?v5)
             (pred_7 ))



(:action op_1
:parameters (?v6 ?v2 ?v8 ?v7)
:precondition (and (pred_1 ?v6) (pred_1 ?v2) (pred_12 ?v8) (pred_2 ?v7)
          (pred_9 ?v6 ?v2) (pred_4 ?v8 ?v7)
                   (pred_8 ?v2 ?v7) (pred_3 ?v6) 
                   (pred_6 ?v2) (pred_11 ?v8))
:effect (and  (pred_10 ?v2) (not (pred_6 ?v2))))


(:action op_3
:parameters (?v6 ?v10)
:precondition (and (pred_1 ?v6) (pred_1 ?v10)
               (pred_3 ?v6) (pred_9 ?v6 ?v10) (pred_10 ?v10))
:effect (and (pred_3 ?v10) (not (pred_3 ?v6))))

(:action op_2
:parameters (?v6 ?v8)
:precondition (and (pred_1 ?v6) (pred_12 ?v8) 
                  (pred_3 ?v6) (pred_5 ?v8 ?v6) (pred_7 ))
:effect (and (pred_11 ?v8)
   (not (pred_5 ?v8 ?v6)) (not (pred_7 ))))


(:action op_5
:parameters (?v6 ?v4 ?v9)
:precondition (and (pred_1 ?v6) (pred_12 ?v4) (pred_12 ?v9)
                  (pred_3 ?v6) (pred_11 ?v9) (pred_5 ?v4 ?v6))
:effect (and (pred_11 ?v4) (pred_5 ?v9 ?v6)
        (not (pred_11 ?v9)) (not (pred_5 ?v4 ?v6))))

(:action op_4
:parameters (?v6 ?v8)
:precondition (and (pred_1 ?v6) (pred_12 ?v8) 
                  (pred_3 ?v6) (pred_11 ?v8))
:effect (and (pred_7 ) (pred_5 ?v8 ?v6) (not (pred_11 ?v8)))))


	
