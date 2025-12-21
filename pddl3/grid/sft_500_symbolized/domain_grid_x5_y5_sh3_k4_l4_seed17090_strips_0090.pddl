(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v5 ?v4)
             (pred_4 ?v2 ?v6)
             (pred_10 ?v5 ?v6)
             (pred_11 ?v11 ?v5 )
	     (pred_6 ?v5)
             (pred_1 ?v9)
             (pred_2 ?v2)
             (pred_3 ?v6)
             (pred_8 ?v5)
             (pred_5 ?v2)
             (pred_9 ?v5)
             (pred_12 ))



(:action op_3
:parameters (?v1 ?v8 ?v3 ?v10)
:precondition (and (pred_1 ?v1) (pred_1 ?v8) (pred_2 ?v3) (pred_3 ?v10)
          (pred_7 ?v1 ?v8) (pred_4 ?v3 ?v10)
                   (pred_10 ?v8 ?v10) (pred_6 ?v1) 
                   (pred_8 ?v8) (pred_5 ?v3))
:effect (and  (pred_9 ?v8) (not (pred_8 ?v8))))


(:action op_1
:parameters (?v1 ?v7)
:precondition (and (pred_1 ?v1) (pred_1 ?v7)
               (pred_6 ?v1) (pred_7 ?v1 ?v7) (pred_9 ?v7))
:effect (and (pred_6 ?v7) (not (pred_6 ?v1))))

(:action op_2
:parameters (?v1 ?v3)
:precondition (and (pred_1 ?v1) (pred_2 ?v3) 
                  (pred_6 ?v1) (pred_11 ?v3 ?v1) (pred_12 ))
:effect (and (pred_5 ?v3)
   (not (pred_11 ?v3 ?v1)) (not (pred_12 ))))


(:action op_5
:parameters (?v1 ?v12 ?v13)
:precondition (and (pred_1 ?v1) (pred_2 ?v12) (pred_2 ?v13)
                  (pred_6 ?v1) (pred_5 ?v13) (pred_11 ?v12 ?v1))
:effect (and (pred_5 ?v12) (pred_11 ?v13 ?v1)
        (not (pred_5 ?v13)) (not (pred_11 ?v12 ?v1))))

(:action op_4
:parameters (?v1 ?v3)
:precondition (and (pred_1 ?v1) (pred_2 ?v3) 
                  (pred_6 ?v1) (pred_5 ?v3))
:effect (and (pred_12 ) (pred_11 ?v3 ?v1) (not (pred_5 ?v3)))))


	
