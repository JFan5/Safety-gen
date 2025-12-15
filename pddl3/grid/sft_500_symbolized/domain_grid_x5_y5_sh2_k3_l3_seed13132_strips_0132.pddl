(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v6 ?v3)
             (pred_8 ?v11 ?v7)
             (pred_3 ?v6 ?v7)
             (pred_1 ?v5 ?v6 )
	     (pred_4 ?v6)
             (pred_11 ?v10)
             (pred_6 ?v11)
             (pred_5 ?v7)
             (pred_2 ?v6)
             (pred_9 ?v11)
             (pred_10 ?v6)
             (pred_7 ))



(:action op_5
:parameters (?v1 ?v13 ?v8 ?v4)
:precondition (and (pred_11 ?v1) (pred_11 ?v13) (pred_6 ?v8) (pred_5 ?v4)
          (pred_12 ?v1 ?v13) (pred_8 ?v8 ?v4)
                   (pred_3 ?v13 ?v4) (pred_4 ?v1) 
                   (pred_2 ?v13) (pred_9 ?v8))
:effect (and  (pred_10 ?v13) (not (pred_2 ?v13))))


(:action op_1
:parameters (?v1 ?v12)
:precondition (and (pred_11 ?v1) (pred_11 ?v12)
               (pred_4 ?v1) (pred_12 ?v1 ?v12) (pred_10 ?v12))
:effect (and (pred_4 ?v12) (not (pred_4 ?v1))))

(:action op_3
:parameters (?v1 ?v8)
:precondition (and (pred_11 ?v1) (pred_6 ?v8) 
                  (pred_4 ?v1) (pred_1 ?v8 ?v1) (pred_7 ))
:effect (and (pred_9 ?v8)
   (not (pred_1 ?v8 ?v1)) (not (pred_7 ))))


(:action op_2
:parameters (?v1 ?v9 ?v2)
:precondition (and (pred_11 ?v1) (pred_6 ?v9) (pred_6 ?v2)
                  (pred_4 ?v1) (pred_9 ?v2) (pred_1 ?v9 ?v1))
:effect (and (pred_9 ?v9) (pred_1 ?v2 ?v1)
        (not (pred_9 ?v2)) (not (pred_1 ?v9 ?v1))))

(:action op_4
:parameters (?v1 ?v8)
:precondition (and (pred_11 ?v1) (pred_6 ?v8) 
                  (pred_4 ?v1) (pred_9 ?v8))
:effect (and (pred_7 ) (pred_1 ?v8 ?v1) (not (pred_9 ?v8)))))


	
