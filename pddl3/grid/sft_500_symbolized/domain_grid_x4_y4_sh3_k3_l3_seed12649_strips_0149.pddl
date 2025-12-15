(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v13 ?v6)
             (pred_1 ?v5 ?v3)
             (pred_3 ?v13 ?v3)
             (pred_10 ?v2 ?v13 )
	     (pred_8 ?v13)
             (pred_11 ?v4)
             (pred_5 ?v5)
             (pred_4 ?v3)
             (pred_2 ?v13)
             (pred_9 ?v5)
             (pred_7 ?v13)
             (pred_6 ))



(:action op_2
:parameters (?v8 ?v11 ?v9 ?v7)
:precondition (and (pred_11 ?v8) (pred_11 ?v11) (pred_5 ?v9) (pred_4 ?v7)
          (pred_12 ?v8 ?v11) (pred_1 ?v9 ?v7)
                   (pred_3 ?v11 ?v7) (pred_8 ?v8) 
                   (pred_2 ?v11) (pred_9 ?v9))
:effect (and  (pred_7 ?v11) (not (pred_2 ?v11))))


(:action op_4
:parameters (?v8 ?v10)
:precondition (and (pred_11 ?v8) (pred_11 ?v10)
               (pred_8 ?v8) (pred_12 ?v8 ?v10) (pred_7 ?v10))
:effect (and (pred_8 ?v10) (not (pred_8 ?v8))))

(:action op_5
:parameters (?v8 ?v9)
:precondition (and (pred_11 ?v8) (pred_5 ?v9) 
                  (pred_8 ?v8) (pred_10 ?v9 ?v8) (pred_6 ))
:effect (and (pred_9 ?v9)
   (not (pred_10 ?v9 ?v8)) (not (pred_6 ))))


(:action op_1
:parameters (?v8 ?v1 ?v12)
:precondition (and (pred_11 ?v8) (pred_5 ?v1) (pred_5 ?v12)
                  (pred_8 ?v8) (pred_9 ?v12) (pred_10 ?v1 ?v8))
:effect (and (pred_9 ?v1) (pred_10 ?v12 ?v8)
        (not (pred_9 ?v12)) (not (pred_10 ?v1 ?v8))))

(:action op_3
:parameters (?v8 ?v9)
:precondition (and (pred_11 ?v8) (pred_5 ?v9) 
                  (pred_8 ?v8) (pred_9 ?v9))
:effect (and (pred_6 ) (pred_10 ?v9 ?v8) (not (pred_9 ?v9)))))


	
