(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v2 ?v4)
             (pred_4 ?v8 ?v11)
             (pred_8 ?v2 ?v11)
             (pred_9 ?v9 ?v2 )
	     (pred_5 ?v2)
             (pred_1 ?v3)
             (pred_3 ?v8)
             (pred_2 ?v11)
             (pred_10 ?v2)
             (pred_11 ?v8)
             (pred_12 ?v2)
             (pred_6 ))



(:action op_2
:parameters (?v1 ?v13 ?v12 ?v10)
:precondition (and (pred_1 ?v1) (pred_1 ?v13) (pred_3 ?v12) (pred_2 ?v10)
          (pred_7 ?v1 ?v13) (pred_4 ?v12 ?v10)
                   (pred_8 ?v13 ?v10) (pred_5 ?v1) 
                   (pred_10 ?v13) (pred_11 ?v12))
:effect (and  (pred_12 ?v13) (not (pred_10 ?v13))))


(:action op_4
:parameters (?v1 ?v5)
:precondition (and (pred_1 ?v1) (pred_1 ?v5)
               (pred_5 ?v1) (pred_7 ?v1 ?v5) (pred_12 ?v5))
:effect (and (pred_5 ?v5) (not (pred_5 ?v1))))

(:action op_3
:parameters (?v1 ?v12)
:precondition (and (pred_1 ?v1) (pred_3 ?v12) 
                  (pred_5 ?v1) (pred_9 ?v12 ?v1) (pred_6 ))
:effect (and (pred_11 ?v12)
   (not (pred_9 ?v12 ?v1)) (not (pred_6 ))))


(:action op_1
:parameters (?v1 ?v6 ?v7)
:precondition (and (pred_1 ?v1) (pred_3 ?v6) (pred_3 ?v7)
                  (pred_5 ?v1) (pred_11 ?v7) (pred_9 ?v6 ?v1))
:effect (and (pred_11 ?v6) (pred_9 ?v7 ?v1)
        (not (pred_11 ?v7)) (not (pred_9 ?v6 ?v1))))

(:action op_5
:parameters (?v1 ?v12)
:precondition (and (pred_1 ?v1) (pred_3 ?v12) 
                  (pred_5 ?v1) (pred_11 ?v12))
:effect (and (pred_6 ) (pred_9 ?v12 ?v1) (not (pred_11 ?v12)))))


	
