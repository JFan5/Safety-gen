(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v5)
             (pred_6 ?v3 ?v4)
             (pred_5 ?v2 ?v4)
             (pred_1 ?v6 ?v2 )
	     (pred_11 ?v2)
             (pred_4 ?v7)
             (pred_8 ?v3)
             (pred_7 ?v4)
             (pred_3 ?v2)
             (pred_9 ?v3)
             (pred_2 ?v2)
             (pred_12 ))



(:action op_5
:parameters (?v1 ?v13 ?v8 ?v11)
:precondition (and (pred_4 ?v1) (pred_4 ?v13) (pred_8 ?v8) (pred_7 ?v11)
          (pred_10 ?v1 ?v13) (pred_6 ?v8 ?v11)
                   (pred_5 ?v13 ?v11) (pred_11 ?v1) 
                   (pred_3 ?v13) (pred_9 ?v8))
:effect (and  (pred_2 ?v13) (not (pred_3 ?v13))))


(:action op_2
:parameters (?v1 ?v9)
:precondition (and (pred_4 ?v1) (pred_4 ?v9)
               (pred_11 ?v1) (pred_10 ?v1 ?v9) (pred_2 ?v9))
:effect (and (pred_11 ?v9) (not (pred_11 ?v1))))

(:action op_1
:parameters (?v1 ?v8)
:precondition (and (pred_4 ?v1) (pred_8 ?v8) 
                  (pred_11 ?v1) (pred_1 ?v8 ?v1) (pred_12 ))
:effect (and (pred_9 ?v8)
   (not (pred_1 ?v8 ?v1)) (not (pred_12 ))))


(:action op_4
:parameters (?v1 ?v10 ?v12)
:precondition (and (pred_4 ?v1) (pred_8 ?v10) (pred_8 ?v12)
                  (pred_11 ?v1) (pred_9 ?v12) (pred_1 ?v10 ?v1))
:effect (and (pred_9 ?v10) (pred_1 ?v12 ?v1)
        (not (pred_9 ?v12)) (not (pred_1 ?v10 ?v1))))

(:action op_3
:parameters (?v1 ?v8)
:precondition (and (pred_4 ?v1) (pred_8 ?v8) 
                  (pred_11 ?v1) (pred_9 ?v8))
:effect (and (pred_12 ) (pred_1 ?v8 ?v1) (not (pred_9 ?v8)))))


	
