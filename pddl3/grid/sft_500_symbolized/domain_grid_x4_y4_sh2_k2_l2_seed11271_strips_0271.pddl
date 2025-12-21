(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v13 ?v3)
             (pred_5 ?v5 ?v4)
             (pred_7 ?v13 ?v4)
             (pred_4 ?v6 ?v13 )
	     (pred_9 ?v13)
             (pred_3 ?v9)
             (pred_11 ?v5)
             (pred_2 ?v4)
             (pred_8 ?v13)
             (pred_12 ?v5)
             (pred_6 ?v13)
             (pred_1 ))



(:action op_4
:parameters (?v12 ?v8 ?v1 ?v7)
:precondition (and (pred_3 ?v12) (pred_3 ?v8) (pred_11 ?v1) (pred_2 ?v7)
          (pred_10 ?v12 ?v8) (pred_5 ?v1 ?v7)
                   (pred_7 ?v8 ?v7) (pred_9 ?v12) 
                   (pred_8 ?v8) (pred_12 ?v1))
:effect (and  (pred_6 ?v8) (not (pred_8 ?v8))))


(:action op_3
:parameters (?v12 ?v11)
:precondition (and (pred_3 ?v12) (pred_3 ?v11)
               (pred_9 ?v12) (pred_10 ?v12 ?v11) (pred_6 ?v11))
:effect (and (pred_9 ?v11) (not (pred_9 ?v12))))

(:action op_5
:parameters (?v12 ?v1)
:precondition (and (pred_3 ?v12) (pred_11 ?v1) 
                  (pred_9 ?v12) (pred_4 ?v1 ?v12) (pred_1 ))
:effect (and (pred_12 ?v1)
   (not (pred_4 ?v1 ?v12)) (not (pred_1 ))))


(:action op_2
:parameters (?v12 ?v2 ?v10)
:precondition (and (pred_3 ?v12) (pred_11 ?v2) (pred_11 ?v10)
                  (pred_9 ?v12) (pred_12 ?v10) (pred_4 ?v2 ?v12))
:effect (and (pred_12 ?v2) (pred_4 ?v10 ?v12)
        (not (pred_12 ?v10)) (not (pred_4 ?v2 ?v12))))

(:action op_1
:parameters (?v12 ?v1)
:precondition (and (pred_3 ?v12) (pred_11 ?v1) 
                  (pred_9 ?v12) (pred_12 ?v1))
:effect (and (pred_1 ) (pred_4 ?v1 ?v12) (not (pred_12 ?v1)))))


	
