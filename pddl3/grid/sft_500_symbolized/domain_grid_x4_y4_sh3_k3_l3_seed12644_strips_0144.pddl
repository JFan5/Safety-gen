(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v2 ?v11)
             (pred_9 ?v4 ?v3)
             (pred_11 ?v2 ?v3)
             (pred_3 ?v9 ?v2 )
	     (pred_6 ?v2)
             (pred_1 ?v6)
             (pred_7 ?v4)
             (pred_12 ?v3)
             (pred_5 ?v2)
             (pred_2 ?v4)
             (pred_10 ?v2)
             (pred_4 ))



(:action op_5
:parameters (?v8 ?v12 ?v5 ?v10)
:precondition (and (pred_1 ?v8) (pred_1 ?v12) (pred_7 ?v5) (pred_12 ?v10)
          (pred_8 ?v8 ?v12) (pred_9 ?v5 ?v10)
                   (pred_11 ?v12 ?v10) (pred_6 ?v8) 
                   (pred_5 ?v12) (pred_2 ?v5))
:effect (and  (pred_10 ?v12) (not (pred_5 ?v12))))


(:action op_2
:parameters (?v8 ?v13)
:precondition (and (pred_1 ?v8) (pred_1 ?v13)
               (pred_6 ?v8) (pred_8 ?v8 ?v13) (pred_10 ?v13))
:effect (and (pred_6 ?v13) (not (pred_6 ?v8))))

(:action op_3
:parameters (?v8 ?v5)
:precondition (and (pred_1 ?v8) (pred_7 ?v5) 
                  (pred_6 ?v8) (pred_3 ?v5 ?v8) (pred_4 ))
:effect (and (pred_2 ?v5)
   (not (pred_3 ?v5 ?v8)) (not (pred_4 ))))


(:action op_4
:parameters (?v8 ?v7 ?v1)
:precondition (and (pred_1 ?v8) (pred_7 ?v7) (pred_7 ?v1)
                  (pred_6 ?v8) (pred_2 ?v1) (pred_3 ?v7 ?v8))
:effect (and (pred_2 ?v7) (pred_3 ?v1 ?v8)
        (not (pred_2 ?v1)) (not (pred_3 ?v7 ?v8))))

(:action op_1
:parameters (?v8 ?v5)
:precondition (and (pred_1 ?v8) (pred_7 ?v5) 
                  (pred_6 ?v8) (pred_2 ?v5))
:effect (and (pred_4 ) (pred_3 ?v5 ?v8) (not (pred_2 ?v5)))))


	
