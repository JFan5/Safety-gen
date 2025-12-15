(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v10 ?v8)
             (pred_10 ?v2 ?v3)
             (pred_2 ?v10 ?v3)
             (pred_6 ?v9 ?v10 )
	     (pred_3 ?v10)
             (pred_1 ?v7)
             (pred_4 ?v2)
             (pred_5 ?v3)
             (pred_12 ?v10)
             (pred_9 ?v2)
             (pred_11 ?v10)
             (pred_7 ))



(:action op_1
:parameters (?v5 ?v13 ?v12 ?v1)
:precondition (and (pred_1 ?v5) (pred_1 ?v13) (pred_4 ?v12) (pred_5 ?v1)
          (pred_8 ?v5 ?v13) (pred_10 ?v12 ?v1)
                   (pred_2 ?v13 ?v1) (pred_3 ?v5) 
                   (pred_12 ?v13) (pred_9 ?v12))
:effect (and  (pred_11 ?v13) (not (pred_12 ?v13))))


(:action op_2
:parameters (?v5 ?v6)
:precondition (and (pred_1 ?v5) (pred_1 ?v6)
               (pred_3 ?v5) (pred_8 ?v5 ?v6) (pred_11 ?v6))
:effect (and (pred_3 ?v6) (not (pred_3 ?v5))))

(:action op_5
:parameters (?v5 ?v12)
:precondition (and (pred_1 ?v5) (pred_4 ?v12) 
                  (pred_3 ?v5) (pred_6 ?v12 ?v5) (pred_7 ))
:effect (and (pred_9 ?v12)
   (not (pred_6 ?v12 ?v5)) (not (pred_7 ))))


(:action op_3
:parameters (?v5 ?v11 ?v4)
:precondition (and (pred_1 ?v5) (pred_4 ?v11) (pred_4 ?v4)
                  (pred_3 ?v5) (pred_9 ?v4) (pred_6 ?v11 ?v5))
:effect (and (pred_9 ?v11) (pred_6 ?v4 ?v5)
        (not (pred_9 ?v4)) (not (pred_6 ?v11 ?v5))))

(:action op_4
:parameters (?v5 ?v12)
:precondition (and (pred_1 ?v5) (pred_4 ?v12) 
                  (pred_3 ?v5) (pred_9 ?v12))
:effect (and (pred_7 ) (pred_6 ?v12 ?v5) (not (pred_9 ?v12)))))


	
