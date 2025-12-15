(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v2 ?v13)
             (pred_8 ?v9 ?v4)
             (pred_7 ?v2 ?v4)
             (pred_12 ?v6 ?v2 )
	     (pred_10 ?v2)
             (pred_4 ?v10)
             (pred_5 ?v9)
             (pred_3 ?v4)
             (pred_2 ?v2)
             (pred_11 ?v9)
             (pred_1 ?v2)
             (pred_9 ))



(:action op_4
:parameters (?v12 ?v8 ?v5 ?v7)
:precondition (and (pred_4 ?v12) (pred_4 ?v8) (pred_5 ?v5) (pred_3 ?v7)
          (pred_6 ?v12 ?v8) (pred_8 ?v5 ?v7)
                   (pred_7 ?v8 ?v7) (pred_10 ?v12) 
                   (pred_2 ?v8) (pred_11 ?v5))
:effect (and  (pred_1 ?v8) (not (pred_2 ?v8))))


(:action op_3
:parameters (?v12 ?v1)
:precondition (and (pred_4 ?v12) (pred_4 ?v1)
               (pred_10 ?v12) (pred_6 ?v12 ?v1) (pred_1 ?v1))
:effect (and (pred_10 ?v1) (not (pred_10 ?v12))))

(:action op_5
:parameters (?v12 ?v5)
:precondition (and (pred_4 ?v12) (pred_5 ?v5) 
                  (pred_10 ?v12) (pred_12 ?v5 ?v12) (pred_9 ))
:effect (and (pred_11 ?v5)
   (not (pred_12 ?v5 ?v12)) (not (pred_9 ))))


(:action op_1
:parameters (?v12 ?v3 ?v11)
:precondition (and (pred_4 ?v12) (pred_5 ?v3) (pred_5 ?v11)
                  (pred_10 ?v12) (pred_11 ?v11) (pred_12 ?v3 ?v12))
:effect (and (pred_11 ?v3) (pred_12 ?v11 ?v12)
        (not (pred_11 ?v11)) (not (pred_12 ?v3 ?v12))))

(:action op_2
:parameters (?v12 ?v5)
:precondition (and (pred_4 ?v12) (pred_5 ?v5) 
                  (pred_10 ?v12) (pred_11 ?v5))
:effect (and (pred_9 ) (pred_12 ?v5 ?v12) (not (pred_11 ?v5)))))


	
