(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v7 ?v4)
             (pred_6 ?v3 ?v1)
             (pred_10 ?v7 ?v1)
             (pred_1 ?v13 ?v7 )
	     (pred_7 ?v7)
             (pred_9 ?v9)
             (pred_4 ?v3)
             (pred_3 ?v1)
             (pred_11 ?v7)
             (pred_5 ?v3)
             (pred_2 ?v7)
             (pred_8 ))



(:action op_2
:parameters (?v6 ?v2 ?v10 ?v12)
:precondition (and (pred_9 ?v6) (pred_9 ?v2) (pred_4 ?v10) (pred_3 ?v12)
          (pred_12 ?v6 ?v2) (pred_6 ?v10 ?v12)
                   (pred_10 ?v2 ?v12) (pred_7 ?v6) 
                   (pred_11 ?v2) (pred_5 ?v10))
:effect (and  (pred_2 ?v2) (not (pred_11 ?v2))))


(:action op_5
:parameters (?v6 ?v5)
:precondition (and (pred_9 ?v6) (pred_9 ?v5)
               (pred_7 ?v6) (pred_12 ?v6 ?v5) (pred_2 ?v5))
:effect (and (pred_7 ?v5) (not (pred_7 ?v6))))

(:action op_3
:parameters (?v6 ?v10)
:precondition (and (pred_9 ?v6) (pred_4 ?v10) 
                  (pred_7 ?v6) (pred_1 ?v10 ?v6) (pred_8 ))
:effect (and (pred_5 ?v10)
   (not (pred_1 ?v10 ?v6)) (not (pred_8 ))))


(:action op_4
:parameters (?v6 ?v8 ?v11)
:precondition (and (pred_9 ?v6) (pred_4 ?v8) (pred_4 ?v11)
                  (pred_7 ?v6) (pred_5 ?v11) (pred_1 ?v8 ?v6))
:effect (and (pred_5 ?v8) (pred_1 ?v11 ?v6)
        (not (pred_5 ?v11)) (not (pred_1 ?v8 ?v6))))

(:action op_1
:parameters (?v6 ?v10)
:precondition (and (pred_9 ?v6) (pred_4 ?v10) 
                  (pred_7 ?v6) (pred_5 ?v10))
:effect (and (pred_8 ) (pred_1 ?v10 ?v6) (not (pred_5 ?v10)))))


	
