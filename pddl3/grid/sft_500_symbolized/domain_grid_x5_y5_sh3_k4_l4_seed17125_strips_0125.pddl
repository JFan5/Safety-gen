(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v8 ?v11)
             (pred_12 ?v7 ?v10)
             (pred_3 ?v8 ?v10)
             (pred_9 ?v1 ?v8 )
	     (pred_5 ?v8)
             (pred_1 ?v13)
             (pred_8 ?v7)
             (pred_6 ?v10)
             (pred_2 ?v8)
             (pred_11 ?v7)
             (pred_10 ?v8)
             (pred_7 ))



(:action op_5
:parameters (?v6 ?v5 ?v12 ?v3)
:precondition (and (pred_1 ?v6) (pred_1 ?v5) (pred_8 ?v12) (pred_6 ?v3)
          (pred_4 ?v6 ?v5) (pred_12 ?v12 ?v3)
                   (pred_3 ?v5 ?v3) (pred_5 ?v6) 
                   (pred_2 ?v5) (pred_11 ?v12))
:effect (and  (pred_10 ?v5) (not (pred_2 ?v5))))


(:action op_1
:parameters (?v6 ?v2)
:precondition (and (pred_1 ?v6) (pred_1 ?v2)
               (pred_5 ?v6) (pred_4 ?v6 ?v2) (pred_10 ?v2))
:effect (and (pred_5 ?v2) (not (pred_5 ?v6))))

(:action op_2
:parameters (?v6 ?v12)
:precondition (and (pred_1 ?v6) (pred_8 ?v12) 
                  (pred_5 ?v6) (pred_9 ?v12 ?v6) (pred_7 ))
:effect (and (pred_11 ?v12)
   (not (pred_9 ?v12 ?v6)) (not (pred_7 ))))


(:action op_3
:parameters (?v6 ?v9 ?v4)
:precondition (and (pred_1 ?v6) (pred_8 ?v9) (pred_8 ?v4)
                  (pred_5 ?v6) (pred_11 ?v4) (pred_9 ?v9 ?v6))
:effect (and (pred_11 ?v9) (pred_9 ?v4 ?v6)
        (not (pred_11 ?v4)) (not (pred_9 ?v9 ?v6))))

(:action op_4
:parameters (?v6 ?v12)
:precondition (and (pred_1 ?v6) (pred_8 ?v12) 
                  (pred_5 ?v6) (pred_11 ?v12))
:effect (and (pred_7 ) (pred_9 ?v12 ?v6) (not (pred_11 ?v12)))))


	
