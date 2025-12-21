(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v10 ?v5)
             (pred_10 ?v9 ?v2)
             (pred_11 ?v10 ?v2)
             (pred_6 ?v11 ?v10 )
	     (pred_5 ?v10)
             (pred_1 ?v13)
             (pred_12 ?v9)
             (pred_8 ?v2)
             (pred_3 ?v10)
             (pred_2 ?v9)
             (pred_7 ?v10)
             (pred_4 ))



(:action op_2
:parameters (?v1 ?v8 ?v7 ?v12)
:precondition (and (pred_1 ?v1) (pred_1 ?v8) (pred_12 ?v7) (pred_8 ?v12)
          (pred_9 ?v1 ?v8) (pred_10 ?v7 ?v12)
                   (pred_11 ?v8 ?v12) (pred_5 ?v1) 
                   (pred_3 ?v8) (pred_2 ?v7))
:effect (and  (pred_7 ?v8) (not (pred_3 ?v8))))


(:action op_3
:parameters (?v1 ?v3)
:precondition (and (pred_1 ?v1) (pred_1 ?v3)
               (pred_5 ?v1) (pred_9 ?v1 ?v3) (pred_7 ?v3))
:effect (and (pred_5 ?v3) (not (pred_5 ?v1))))

(:action op_4
:parameters (?v1 ?v7)
:precondition (and (pred_1 ?v1) (pred_12 ?v7) 
                  (pred_5 ?v1) (pred_6 ?v7 ?v1) (pred_4 ))
:effect (and (pred_2 ?v7)
   (not (pred_6 ?v7 ?v1)) (not (pred_4 ))))


(:action op_1
:parameters (?v1 ?v4 ?v6)
:precondition (and (pred_1 ?v1) (pred_12 ?v4) (pred_12 ?v6)
                  (pred_5 ?v1) (pred_2 ?v6) (pred_6 ?v4 ?v1))
:effect (and (pred_2 ?v4) (pred_6 ?v6 ?v1)
        (not (pred_2 ?v6)) (not (pred_6 ?v4 ?v1))))

(:action op_5
:parameters (?v1 ?v7)
:precondition (and (pred_1 ?v1) (pred_12 ?v7) 
                  (pred_5 ?v1) (pred_2 ?v7))
:effect (and (pred_4 ) (pred_6 ?v7 ?v1) (not (pred_2 ?v7)))))


	
