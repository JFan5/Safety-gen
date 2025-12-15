(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v7 ?v2)
             (pred_12 ?v4 ?v3)
             (pred_11 ?v7 ?v3)
             (pred_4 ?v6 ?v7 )
	     (pred_6 ?v7)
             (pred_1 ?v13)
             (pred_2 ?v4)
             (pred_5 ?v3)
             (pred_9 ?v7)
             (pred_3 ?v4)
             (pred_10 ?v7)
             (pred_8 ))



(:action op_4
:parameters (?v8 ?v12 ?v11 ?v9)
:precondition (and (pred_1 ?v8) (pred_1 ?v12) (pred_2 ?v11) (pred_5 ?v9)
          (pred_7 ?v8 ?v12) (pred_12 ?v11 ?v9)
                   (pred_11 ?v12 ?v9) (pred_6 ?v8) 
                   (pred_9 ?v12) (pred_3 ?v11))
:effect (and  (pred_10 ?v12) (not (pred_9 ?v12))))


(:action op_3
:parameters (?v8 ?v5)
:precondition (and (pred_1 ?v8) (pred_1 ?v5)
               (pred_6 ?v8) (pred_7 ?v8 ?v5) (pred_10 ?v5))
:effect (and (pred_6 ?v5) (not (pred_6 ?v8))))

(:action op_5
:parameters (?v8 ?v11)
:precondition (and (pred_1 ?v8) (pred_2 ?v11) 
                  (pred_6 ?v8) (pred_4 ?v11 ?v8) (pred_8 ))
:effect (and (pred_3 ?v11)
   (not (pred_4 ?v11 ?v8)) (not (pred_8 ))))


(:action op_2
:parameters (?v8 ?v1 ?v10)
:precondition (and (pred_1 ?v8) (pred_2 ?v1) (pred_2 ?v10)
                  (pred_6 ?v8) (pred_3 ?v10) (pred_4 ?v1 ?v8))
:effect (and (pred_3 ?v1) (pred_4 ?v10 ?v8)
        (not (pred_3 ?v10)) (not (pred_4 ?v1 ?v8))))

(:action op_1
:parameters (?v8 ?v11)
:precondition (and (pred_1 ?v8) (pred_2 ?v11) 
                  (pred_6 ?v8) (pred_3 ?v11))
:effect (and (pred_8 ) (pred_4 ?v11 ?v8) (not (pred_3 ?v11)))))


	
