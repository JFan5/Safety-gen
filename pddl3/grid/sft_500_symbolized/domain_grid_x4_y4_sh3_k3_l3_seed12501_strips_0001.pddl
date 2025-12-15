(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v5 ?v11)
             (pred_6 ?v7 ?v10)
             (pred_7 ?v5 ?v10)
             (pred_9 ?v12 ?v5 )
	     (pred_1 ?v5)
             (pred_4 ?v13)
             (pred_8 ?v7)
             (pred_10 ?v10)
             (pred_12 ?v5)
             (pred_3 ?v7)
             (pred_5 ?v5)
             (pred_2 ))



(:action op_3
:parameters (?v1 ?v8 ?v4 ?v9)
:precondition (and (pred_4 ?v1) (pred_4 ?v8) (pred_8 ?v4) (pred_10 ?v9)
          (pred_11 ?v1 ?v8) (pred_6 ?v4 ?v9)
                   (pred_7 ?v8 ?v9) (pred_1 ?v1) 
                   (pred_12 ?v8) (pred_3 ?v4))
:effect (and  (pred_5 ?v8) (not (pred_12 ?v8))))


(:action op_4
:parameters (?v1 ?v3)
:precondition (and (pred_4 ?v1) (pred_4 ?v3)
               (pred_1 ?v1) (pred_11 ?v1 ?v3) (pred_5 ?v3))
:effect (and (pred_1 ?v3) (not (pred_1 ?v1))))

(:action op_1
:parameters (?v1 ?v4)
:precondition (and (pred_4 ?v1) (pred_8 ?v4) 
                  (pred_1 ?v1) (pred_9 ?v4 ?v1) (pred_2 ))
:effect (and (pred_3 ?v4)
   (not (pred_9 ?v4 ?v1)) (not (pred_2 ))))


(:action op_2
:parameters (?v1 ?v6 ?v2)
:precondition (and (pred_4 ?v1) (pred_8 ?v6) (pred_8 ?v2)
                  (pred_1 ?v1) (pred_3 ?v2) (pred_9 ?v6 ?v1))
:effect (and (pred_3 ?v6) (pred_9 ?v2 ?v1)
        (not (pred_3 ?v2)) (not (pred_9 ?v6 ?v1))))

(:action op_5
:parameters (?v1 ?v4)
:precondition (and (pred_4 ?v1) (pred_8 ?v4) 
                  (pred_1 ?v1) (pred_3 ?v4))
:effect (and (pred_2 ) (pred_9 ?v4 ?v1) (not (pred_3 ?v4)))))


	
