(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v12 ?v11)
             (pred_1 ?v2 ?v9)
             (pred_8 ?v12 ?v9)
             (pred_11 ?v6 ?v12 )
	     (pred_12 ?v12)
             (pred_6 ?v10)
             (pred_4 ?v2)
             (pred_10 ?v9)
             (pred_2 ?v12)
             (pred_3 ?v2)
             (pred_9 ?v12)
             (pred_7 ))



(:action op_3
:parameters (?v1 ?v13 ?v5 ?v3)
:precondition (and (pred_6 ?v1) (pred_6 ?v13) (pred_4 ?v5) (pred_10 ?v3)
          (pred_5 ?v1 ?v13) (pred_1 ?v5 ?v3)
                   (pred_8 ?v13 ?v3) (pred_12 ?v1) 
                   (pred_2 ?v13) (pred_3 ?v5))
:effect (and  (pred_9 ?v13) (not (pred_2 ?v13))))


(:action op_4
:parameters (?v1 ?v8)
:precondition (and (pred_6 ?v1) (pred_6 ?v8)
               (pred_12 ?v1) (pred_5 ?v1 ?v8) (pred_9 ?v8))
:effect (and (pred_12 ?v8) (not (pred_12 ?v1))))

(:action op_5
:parameters (?v1 ?v5)
:precondition (and (pred_6 ?v1) (pred_4 ?v5) 
                  (pred_12 ?v1) (pred_11 ?v5 ?v1) (pred_7 ))
:effect (and (pred_3 ?v5)
   (not (pred_11 ?v5 ?v1)) (not (pred_7 ))))


(:action op_1
:parameters (?v1 ?v7 ?v4)
:precondition (and (pred_6 ?v1) (pred_4 ?v7) (pred_4 ?v4)
                  (pred_12 ?v1) (pred_3 ?v4) (pred_11 ?v7 ?v1))
:effect (and (pred_3 ?v7) (pred_11 ?v4 ?v1)
        (not (pred_3 ?v4)) (not (pred_11 ?v7 ?v1))))

(:action op_2
:parameters (?v1 ?v5)
:precondition (and (pred_6 ?v1) (pred_4 ?v5) 
                  (pred_12 ?v1) (pred_3 ?v5))
:effect (and (pred_7 ) (pred_11 ?v5 ?v1) (not (pred_3 ?v5)))))


	
