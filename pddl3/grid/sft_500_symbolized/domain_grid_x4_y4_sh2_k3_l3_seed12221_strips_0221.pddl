(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v9 ?v1)
             (pred_12 ?v2 ?v7)
             (pred_7 ?v9 ?v7)
             (pred_8 ?v5 ?v9 )
	     (pred_5 ?v9)
             (pred_2 ?v6)
             (pred_9 ?v2)
             (pred_11 ?v7)
             (pred_1 ?v9)
             (pred_10 ?v2)
             (pred_4 ?v9)
             (pred_3 ))



(:action op_1
:parameters (?v8 ?v10 ?v13 ?v11)
:precondition (and (pred_2 ?v8) (pred_2 ?v10) (pred_9 ?v13) (pred_11 ?v11)
          (pred_6 ?v8 ?v10) (pred_12 ?v13 ?v11)
                   (pred_7 ?v10 ?v11) (pred_5 ?v8) 
                   (pred_1 ?v10) (pred_10 ?v13))
:effect (and  (pred_4 ?v10) (not (pred_1 ?v10))))


(:action op_4
:parameters (?v8 ?v3)
:precondition (and (pred_2 ?v8) (pred_2 ?v3)
               (pred_5 ?v8) (pred_6 ?v8 ?v3) (pred_4 ?v3))
:effect (and (pred_5 ?v3) (not (pred_5 ?v8))))

(:action op_3
:parameters (?v8 ?v13)
:precondition (and (pred_2 ?v8) (pred_9 ?v13) 
                  (pred_5 ?v8) (pred_8 ?v13 ?v8) (pred_3 ))
:effect (and (pred_10 ?v13)
   (not (pred_8 ?v13 ?v8)) (not (pred_3 ))))


(:action op_5
:parameters (?v8 ?v4 ?v12)
:precondition (and (pred_2 ?v8) (pred_9 ?v4) (pred_9 ?v12)
                  (pred_5 ?v8) (pred_10 ?v12) (pred_8 ?v4 ?v8))
:effect (and (pred_10 ?v4) (pred_8 ?v12 ?v8)
        (not (pred_10 ?v12)) (not (pred_8 ?v4 ?v8))))

(:action op_2
:parameters (?v8 ?v13)
:precondition (and (pred_2 ?v8) (pred_9 ?v13) 
                  (pred_5 ?v8) (pred_10 ?v13))
:effect (and (pred_3 ) (pred_8 ?v13 ?v8) (not (pred_10 ?v13)))))


	
