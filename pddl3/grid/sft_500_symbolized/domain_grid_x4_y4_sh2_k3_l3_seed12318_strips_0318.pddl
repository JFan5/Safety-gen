(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v4 ?v9)
             (pred_3 ?v8 ?v2)
             (pred_11 ?v4 ?v2)
             (pred_7 ?v6 ?v4 )
	     (pred_9 ?v4)
             (pred_10 ?v12)
             (pred_4 ?v8)
             (pred_5 ?v2)
             (pred_12 ?v4)
             (pred_1 ?v8)
             (pred_6 ?v4)
             (pred_8 ))



(:action op_2
:parameters (?v1 ?v13 ?v5 ?v10)
:precondition (and (pred_10 ?v1) (pred_10 ?v13) (pred_4 ?v5) (pred_5 ?v10)
          (pred_2 ?v1 ?v13) (pred_3 ?v5 ?v10)
                   (pred_11 ?v13 ?v10) (pred_9 ?v1) 
                   (pred_12 ?v13) (pred_1 ?v5))
:effect (and  (pred_6 ?v13) (not (pred_12 ?v13))))


(:action op_4
:parameters (?v1 ?v3)
:precondition (and (pred_10 ?v1) (pred_10 ?v3)
               (pred_9 ?v1) (pred_2 ?v1 ?v3) (pred_6 ?v3))
:effect (and (pred_9 ?v3) (not (pred_9 ?v1))))

(:action op_3
:parameters (?v1 ?v5)
:precondition (and (pred_10 ?v1) (pred_4 ?v5) 
                  (pred_9 ?v1) (pred_7 ?v5 ?v1) (pred_8 ))
:effect (and (pred_1 ?v5)
   (not (pred_7 ?v5 ?v1)) (not (pred_8 ))))


(:action op_1
:parameters (?v1 ?v7 ?v11)
:precondition (and (pred_10 ?v1) (pred_4 ?v7) (pred_4 ?v11)
                  (pred_9 ?v1) (pred_1 ?v11) (pred_7 ?v7 ?v1))
:effect (and (pred_1 ?v7) (pred_7 ?v11 ?v1)
        (not (pred_1 ?v11)) (not (pred_7 ?v7 ?v1))))

(:action op_5
:parameters (?v1 ?v5)
:precondition (and (pred_10 ?v1) (pred_4 ?v5) 
                  (pred_9 ?v1) (pred_1 ?v5))
:effect (and (pred_8 ) (pred_7 ?v5 ?v1) (not (pred_1 ?v5)))))


	
