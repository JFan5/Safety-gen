(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v6 ?v2)
             (pred_6 ?v5 ?v13)
             (pred_11 ?v6 ?v13)
             (pred_12 ?v11 ?v6 )
	     (pred_2 ?v6)
             (pred_9 ?v3)
             (pred_7 ?v5)
             (pred_10 ?v13)
             (pred_3 ?v6)
             (pred_4 ?v5)
             (pred_5 ?v6)
             (pred_1 ))



(:action op_3
:parameters (?v8 ?v12 ?v7 ?v9)
:precondition (and (pred_9 ?v8) (pred_9 ?v12) (pred_7 ?v7) (pred_10 ?v9)
          (pred_8 ?v8 ?v12) (pred_6 ?v7 ?v9)
                   (pred_11 ?v12 ?v9) (pred_2 ?v8) 
                   (pred_3 ?v12) (pred_4 ?v7))
:effect (and  (pred_5 ?v12) (not (pred_3 ?v12))))


(:action op_4
:parameters (?v8 ?v4)
:precondition (and (pred_9 ?v8) (pred_9 ?v4)
               (pred_2 ?v8) (pred_8 ?v8 ?v4) (pred_5 ?v4))
:effect (and (pred_2 ?v4) (not (pred_2 ?v8))))

(:action op_5
:parameters (?v8 ?v7)
:precondition (and (pred_9 ?v8) (pred_7 ?v7) 
                  (pred_2 ?v8) (pred_12 ?v7 ?v8) (pred_1 ))
:effect (and (pred_4 ?v7)
   (not (pred_12 ?v7 ?v8)) (not (pred_1 ))))


(:action op_1
:parameters (?v8 ?v1 ?v10)
:precondition (and (pred_9 ?v8) (pred_7 ?v1) (pred_7 ?v10)
                  (pred_2 ?v8) (pred_4 ?v10) (pred_12 ?v1 ?v8))
:effect (and (pred_4 ?v1) (pred_12 ?v10 ?v8)
        (not (pred_4 ?v10)) (not (pred_12 ?v1 ?v8))))

(:action op_2
:parameters (?v8 ?v7)
:precondition (and (pred_9 ?v8) (pred_7 ?v7) 
                  (pred_2 ?v8) (pred_4 ?v7))
:effect (and (pred_1 ) (pred_12 ?v7 ?v8) (not (pred_4 ?v7)))))


	
