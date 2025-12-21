(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v7 ?v10)
             (pred_4 ?v4 ?v6)
             (pred_6 ?v7 ?v6)
             (pred_2 ?v9 ?v7 )
	     (pred_12 ?v7)
             (pred_10 ?v2)
             (pred_1 ?v4)
             (pred_5 ?v6)
             (pred_8 ?v7)
             (pred_11 ?v4)
             (pred_3 ?v7)
             (pred_9 ))



(:action op_4
:parameters (?v1 ?v13 ?v5 ?v8)
:precondition (and (pred_10 ?v1) (pred_10 ?v13) (pred_1 ?v5) (pred_5 ?v8)
          (pred_7 ?v1 ?v13) (pred_4 ?v5 ?v8)
                   (pred_6 ?v13 ?v8) (pred_12 ?v1) 
                   (pred_8 ?v13) (pred_11 ?v5))
:effect (and  (pred_3 ?v13) (not (pred_8 ?v13))))


(:action op_3
:parameters (?v1 ?v3)
:precondition (and (pred_10 ?v1) (pred_10 ?v3)
               (pred_12 ?v1) (pred_7 ?v1 ?v3) (pred_3 ?v3))
:effect (and (pred_12 ?v3) (not (pred_12 ?v1))))

(:action op_1
:parameters (?v1 ?v5)
:precondition (and (pred_10 ?v1) (pred_1 ?v5) 
                  (pred_12 ?v1) (pred_2 ?v5 ?v1) (pred_9 ))
:effect (and (pred_11 ?v5)
   (not (pred_2 ?v5 ?v1)) (not (pred_9 ))))


(:action op_5
:parameters (?v1 ?v11 ?v12)
:precondition (and (pred_10 ?v1) (pred_1 ?v11) (pred_1 ?v12)
                  (pred_12 ?v1) (pred_11 ?v12) (pred_2 ?v11 ?v1))
:effect (and (pred_11 ?v11) (pred_2 ?v12 ?v1)
        (not (pred_11 ?v12)) (not (pred_2 ?v11 ?v1))))

(:action op_2
:parameters (?v1 ?v5)
:precondition (and (pred_10 ?v1) (pred_1 ?v5) 
                  (pred_12 ?v1) (pred_11 ?v5))
:effect (and (pred_9 ) (pred_2 ?v5 ?v1) (not (pred_11 ?v5)))))


	
