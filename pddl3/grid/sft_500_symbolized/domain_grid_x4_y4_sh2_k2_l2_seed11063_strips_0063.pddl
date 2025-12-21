(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v12 ?v13)
             (pred_12 ?v4 ?v2)
             (pred_2 ?v12 ?v2)
             (pred_8 ?v11 ?v12 )
	     (pred_9 ?v12)
             (pred_4 ?v7)
             (pred_1 ?v4)
             (pred_10 ?v2)
             (pred_7 ?v12)
             (pred_11 ?v4)
             (pred_5 ?v12)
             (pred_3 ))



(:action op_2
:parameters (?v6 ?v5 ?v10 ?v3)
:precondition (and (pred_4 ?v6) (pred_4 ?v5) (pred_1 ?v10) (pred_10 ?v3)
          (pred_6 ?v6 ?v5) (pred_12 ?v10 ?v3)
                   (pred_2 ?v5 ?v3) (pred_9 ?v6) 
                   (pred_7 ?v5) (pred_11 ?v10))
:effect (and  (pred_5 ?v5) (not (pred_7 ?v5))))


(:action op_5
:parameters (?v6 ?v8)
:precondition (and (pred_4 ?v6) (pred_4 ?v8)
               (pred_9 ?v6) (pred_6 ?v6 ?v8) (pred_5 ?v8))
:effect (and (pred_9 ?v8) (not (pred_9 ?v6))))

(:action op_1
:parameters (?v6 ?v10)
:precondition (and (pred_4 ?v6) (pred_1 ?v10) 
                  (pred_9 ?v6) (pred_8 ?v10 ?v6) (pred_3 ))
:effect (and (pred_11 ?v10)
   (not (pred_8 ?v10 ?v6)) (not (pred_3 ))))


(:action op_4
:parameters (?v6 ?v9 ?v1)
:precondition (and (pred_4 ?v6) (pred_1 ?v9) (pred_1 ?v1)
                  (pred_9 ?v6) (pred_11 ?v1) (pred_8 ?v9 ?v6))
:effect (and (pred_11 ?v9) (pred_8 ?v1 ?v6)
        (not (pred_11 ?v1)) (not (pred_8 ?v9 ?v6))))

(:action op_3
:parameters (?v6 ?v10)
:precondition (and (pred_4 ?v6) (pred_1 ?v10) 
                  (pred_9 ?v6) (pred_11 ?v10))
:effect (and (pred_3 ) (pred_8 ?v10 ?v6) (not (pred_11 ?v10)))))


	
