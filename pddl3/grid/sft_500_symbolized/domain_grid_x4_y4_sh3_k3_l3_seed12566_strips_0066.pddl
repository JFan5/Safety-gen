(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v13 ?v6)
             (pred_6 ?v2 ?v7)
             (pred_2 ?v13 ?v7)
             (pred_7 ?v10 ?v13 )
	     (pred_8 ?v13)
             (pred_12 ?v4)
             (pred_1 ?v2)
             (pred_10 ?v7)
             (pred_9 ?v13)
             (pred_11 ?v2)
             (pred_5 ?v13)
             (pred_3 ))



(:action op_4
:parameters (?v1 ?v3 ?v9 ?v11)
:precondition (and (pred_12 ?v1) (pred_12 ?v3) (pred_1 ?v9) (pred_10 ?v11)
          (pred_4 ?v1 ?v3) (pred_6 ?v9 ?v11)
                   (pred_2 ?v3 ?v11) (pred_8 ?v1) 
                   (pred_9 ?v3) (pred_11 ?v9))
:effect (and  (pred_5 ?v3) (not (pred_9 ?v3))))


(:action op_3
:parameters (?v1 ?v8)
:precondition (and (pred_12 ?v1) (pred_12 ?v8)
               (pred_8 ?v1) (pred_4 ?v1 ?v8) (pred_5 ?v8))
:effect (and (pred_8 ?v8) (not (pred_8 ?v1))))

(:action op_2
:parameters (?v1 ?v9)
:precondition (and (pred_12 ?v1) (pred_1 ?v9) 
                  (pred_8 ?v1) (pred_7 ?v9 ?v1) (pred_3 ))
:effect (and (pred_11 ?v9)
   (not (pred_7 ?v9 ?v1)) (not (pred_3 ))))


(:action op_5
:parameters (?v1 ?v5 ?v12)
:precondition (and (pred_12 ?v1) (pred_1 ?v5) (pred_1 ?v12)
                  (pred_8 ?v1) (pred_11 ?v12) (pred_7 ?v5 ?v1))
:effect (and (pred_11 ?v5) (pred_7 ?v12 ?v1)
        (not (pred_11 ?v12)) (not (pred_7 ?v5 ?v1))))

(:action op_1
:parameters (?v1 ?v9)
:precondition (and (pred_12 ?v1) (pred_1 ?v9) 
                  (pred_8 ?v1) (pred_11 ?v9))
:effect (and (pred_3 ) (pred_7 ?v9 ?v1) (not (pred_11 ?v9)))))


	
