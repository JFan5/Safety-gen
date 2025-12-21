(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v5 ?v9)
             (pred_7 ?v11 ?v10)
             (pred_2 ?v5 ?v10)
             (pred_4 ?v6 ?v5 )
	     (pred_8 ?v5)
             (pred_9 ?v7)
             (pred_11 ?v11)
             (pred_10 ?v10)
             (pred_3 ?v5)
             (pred_1 ?v11)
             (pred_12 ?v5)
             (pred_6 ))



(:action op_4
:parameters (?v3 ?v8 ?v1 ?v13)
:precondition (and (pred_9 ?v3) (pred_9 ?v8) (pred_11 ?v1) (pred_10 ?v13)
          (pred_5 ?v3 ?v8) (pred_7 ?v1 ?v13)
                   (pred_2 ?v8 ?v13) (pred_8 ?v3) 
                   (pred_3 ?v8) (pred_1 ?v1))
:effect (and  (pred_12 ?v8) (not (pred_3 ?v8))))


(:action op_2
:parameters (?v3 ?v12)
:precondition (and (pred_9 ?v3) (pred_9 ?v12)
               (pred_8 ?v3) (pred_5 ?v3 ?v12) (pred_12 ?v12))
:effect (and (pred_8 ?v12) (not (pred_8 ?v3))))

(:action op_5
:parameters (?v3 ?v1)
:precondition (and (pred_9 ?v3) (pred_11 ?v1) 
                  (pred_8 ?v3) (pred_4 ?v1 ?v3) (pred_6 ))
:effect (and (pred_1 ?v1)
   (not (pred_4 ?v1 ?v3)) (not (pred_6 ))))


(:action op_3
:parameters (?v3 ?v4 ?v2)
:precondition (and (pred_9 ?v3) (pred_11 ?v4) (pred_11 ?v2)
                  (pred_8 ?v3) (pred_1 ?v2) (pred_4 ?v4 ?v3))
:effect (and (pred_1 ?v4) (pred_4 ?v2 ?v3)
        (not (pred_1 ?v2)) (not (pred_4 ?v4 ?v3))))

(:action op_1
:parameters (?v3 ?v1)
:precondition (and (pred_9 ?v3) (pred_11 ?v1) 
                  (pred_8 ?v3) (pred_1 ?v1))
:effect (and (pred_6 ) (pred_4 ?v1 ?v3) (not (pred_1 ?v1)))))


	
