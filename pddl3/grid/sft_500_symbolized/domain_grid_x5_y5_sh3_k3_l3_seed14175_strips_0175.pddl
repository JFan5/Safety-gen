(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v7 ?v5)
             (pred_4 ?v1 ?v12)
             (pred_12 ?v7 ?v12)
             (pred_10 ?v4 ?v7 )
	     (pred_7 ?v7)
             (pred_8 ?v3)
             (pred_1 ?v1)
             (pred_6 ?v12)
             (pred_2 ?v7)
             (pred_11 ?v1)
             (pred_5 ?v7)
             (pred_9 ))



(:action op_1
:parameters (?v8 ?v10 ?v9 ?v6)
:precondition (and (pred_8 ?v8) (pred_8 ?v10) (pred_1 ?v9) (pred_6 ?v6)
          (pred_3 ?v8 ?v10) (pred_4 ?v9 ?v6)
                   (pred_12 ?v10 ?v6) (pred_7 ?v8) 
                   (pred_2 ?v10) (pred_11 ?v9))
:effect (and  (pred_5 ?v10) (not (pred_2 ?v10))))


(:action op_3
:parameters (?v8 ?v2)
:precondition (and (pred_8 ?v8) (pred_8 ?v2)
               (pred_7 ?v8) (pred_3 ?v8 ?v2) (pred_5 ?v2))
:effect (and (pred_7 ?v2) (not (pred_7 ?v8))))

(:action op_2
:parameters (?v8 ?v9)
:precondition (and (pred_8 ?v8) (pred_1 ?v9) 
                  (pred_7 ?v8) (pred_10 ?v9 ?v8) (pred_9 ))
:effect (and (pred_11 ?v9)
   (not (pred_10 ?v9 ?v8)) (not (pred_9 ))))


(:action op_5
:parameters (?v8 ?v13 ?v11)
:precondition (and (pred_8 ?v8) (pred_1 ?v13) (pred_1 ?v11)
                  (pred_7 ?v8) (pred_11 ?v11) (pred_10 ?v13 ?v8))
:effect (and (pred_11 ?v13) (pred_10 ?v11 ?v8)
        (not (pred_11 ?v11)) (not (pred_10 ?v13 ?v8))))

(:action op_4
:parameters (?v8 ?v9)
:precondition (and (pred_8 ?v8) (pred_1 ?v9) 
                  (pred_7 ?v8) (pred_11 ?v9))
:effect (and (pred_9 ) (pred_10 ?v9 ?v8) (not (pred_11 ?v9)))))


	
