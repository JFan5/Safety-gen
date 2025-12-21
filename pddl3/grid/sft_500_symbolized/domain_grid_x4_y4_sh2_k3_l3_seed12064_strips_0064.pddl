(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v12 ?v8)
             (pred_2 ?v1 ?v13)
             (pred_5 ?v12 ?v13)
             (pred_9 ?v9 ?v12 )
	     (pred_12 ?v12)
             (pred_11 ?v7)
             (pred_6 ?v1)
             (pred_1 ?v13)
             (pred_8 ?v12)
             (pred_4 ?v1)
             (pred_10 ?v12)
             (pred_7 ))



(:action op_1
:parameters (?v6 ?v2 ?v10 ?v3)
:precondition (and (pred_11 ?v6) (pred_11 ?v2) (pred_6 ?v10) (pred_1 ?v3)
          (pred_3 ?v6 ?v2) (pred_2 ?v10 ?v3)
                   (pred_5 ?v2 ?v3) (pred_12 ?v6) 
                   (pred_8 ?v2) (pred_4 ?v10))
:effect (and  (pred_10 ?v2) (not (pred_8 ?v2))))


(:action op_4
:parameters (?v6 ?v4)
:precondition (and (pred_11 ?v6) (pred_11 ?v4)
               (pred_12 ?v6) (pred_3 ?v6 ?v4) (pred_10 ?v4))
:effect (and (pred_12 ?v4) (not (pred_12 ?v6))))

(:action op_3
:parameters (?v6 ?v10)
:precondition (and (pred_11 ?v6) (pred_6 ?v10) 
                  (pred_12 ?v6) (pred_9 ?v10 ?v6) (pred_7 ))
:effect (and (pred_4 ?v10)
   (not (pred_9 ?v10 ?v6)) (not (pred_7 ))))


(:action op_5
:parameters (?v6 ?v5 ?v11)
:precondition (and (pred_11 ?v6) (pred_6 ?v5) (pred_6 ?v11)
                  (pred_12 ?v6) (pred_4 ?v11) (pred_9 ?v5 ?v6))
:effect (and (pred_4 ?v5) (pred_9 ?v11 ?v6)
        (not (pred_4 ?v11)) (not (pred_9 ?v5 ?v6))))

(:action op_2
:parameters (?v6 ?v10)
:precondition (and (pred_11 ?v6) (pred_6 ?v10) 
                  (pred_12 ?v6) (pred_4 ?v10))
:effect (and (pred_7 ) (pred_9 ?v10 ?v6) (not (pred_4 ?v10)))))


	
