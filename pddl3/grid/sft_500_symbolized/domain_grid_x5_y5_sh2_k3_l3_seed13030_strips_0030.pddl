(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v11 ?v6)
             (pred_7 ?v9 ?v2)
             (pred_6 ?v11 ?v2)
             (pred_12 ?v12 ?v11 )
	     (pred_10 ?v11)
             (pred_2 ?v5)
             (pred_3 ?v9)
             (pred_8 ?v2)
             (pred_11 ?v11)
             (pred_1 ?v9)
             (pred_4 ?v11)
             (pred_5 ))



(:action op_2
:parameters (?v1 ?v8 ?v3 ?v10)
:precondition (and (pred_2 ?v1) (pred_2 ?v8) (pred_3 ?v3) (pred_8 ?v10)
          (pred_9 ?v1 ?v8) (pred_7 ?v3 ?v10)
                   (pred_6 ?v8 ?v10) (pred_10 ?v1) 
                   (pred_11 ?v8) (pred_1 ?v3))
:effect (and  (pred_4 ?v8) (not (pred_11 ?v8))))


(:action op_1
:parameters (?v1 ?v13)
:precondition (and (pred_2 ?v1) (pred_2 ?v13)
               (pred_10 ?v1) (pred_9 ?v1 ?v13) (pred_4 ?v13))
:effect (and (pred_10 ?v13) (not (pred_10 ?v1))))

(:action op_4
:parameters (?v1 ?v3)
:precondition (and (pred_2 ?v1) (pred_3 ?v3) 
                  (pred_10 ?v1) (pred_12 ?v3 ?v1) (pred_5 ))
:effect (and (pred_1 ?v3)
   (not (pred_12 ?v3 ?v1)) (not (pred_5 ))))


(:action op_3
:parameters (?v1 ?v7 ?v4)
:precondition (and (pred_2 ?v1) (pred_3 ?v7) (pred_3 ?v4)
                  (pred_10 ?v1) (pred_1 ?v4) (pred_12 ?v7 ?v1))
:effect (and (pred_1 ?v7) (pred_12 ?v4 ?v1)
        (not (pred_1 ?v4)) (not (pred_12 ?v7 ?v1))))

(:action op_5
:parameters (?v1 ?v3)
:precondition (and (pred_2 ?v1) (pred_3 ?v3) 
                  (pred_10 ?v1) (pred_1 ?v3))
:effect (and (pred_5 ) (pred_12 ?v3 ?v1) (not (pred_1 ?v3)))))


	
