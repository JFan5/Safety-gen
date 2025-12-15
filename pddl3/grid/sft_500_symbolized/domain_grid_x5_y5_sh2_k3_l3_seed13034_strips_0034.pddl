(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v11)
             (pred_11 ?v4 ?v9)
             (pred_1 ?v2 ?v9)
             (pred_2 ?v1 ?v2 )
	     (pred_8 ?v2)
             (pred_4 ?v5)
             (pred_7 ?v4)
             (pred_3 ?v9)
             (pred_9 ?v2)
             (pred_12 ?v4)
             (pred_5 ?v2)
             (pred_6 ))



(:action op_3
:parameters (?v8 ?v10 ?v7 ?v13)
:precondition (and (pred_4 ?v8) (pred_4 ?v10) (pred_7 ?v7) (pred_3 ?v13)
          (pred_10 ?v8 ?v10) (pred_11 ?v7 ?v13)
                   (pred_1 ?v10 ?v13) (pred_8 ?v8) 
                   (pred_9 ?v10) (pred_12 ?v7))
:effect (and  (pred_5 ?v10) (not (pred_9 ?v10))))


(:action op_5
:parameters (?v8 ?v6)
:precondition (and (pred_4 ?v8) (pred_4 ?v6)
               (pred_8 ?v8) (pred_10 ?v8 ?v6) (pred_5 ?v6))
:effect (and (pred_8 ?v6) (not (pred_8 ?v8))))

(:action op_2
:parameters (?v8 ?v7)
:precondition (and (pred_4 ?v8) (pred_7 ?v7) 
                  (pred_8 ?v8) (pred_2 ?v7 ?v8) (pred_6 ))
:effect (and (pred_12 ?v7)
   (not (pred_2 ?v7 ?v8)) (not (pred_6 ))))


(:action op_1
:parameters (?v8 ?v3 ?v12)
:precondition (and (pred_4 ?v8) (pred_7 ?v3) (pred_7 ?v12)
                  (pred_8 ?v8) (pred_12 ?v12) (pred_2 ?v3 ?v8))
:effect (and (pred_12 ?v3) (pred_2 ?v12 ?v8)
        (not (pred_12 ?v12)) (not (pred_2 ?v3 ?v8))))

(:action op_4
:parameters (?v8 ?v7)
:precondition (and (pred_4 ?v8) (pred_7 ?v7) 
                  (pred_8 ?v8) (pred_12 ?v7))
:effect (and (pred_6 ) (pred_2 ?v7 ?v8) (not (pred_12 ?v7)))))


	
