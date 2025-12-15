(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v13 ?v1)
             (pred_9 ?v4 ?v12)
             (pred_1 ?v13 ?v12)
             (pred_8 ?v5 ?v13 )
	     (pred_7 ?v13)
             (pred_10 ?v6)
             (pred_5 ?v4)
             (pred_3 ?v12)
             (pred_11 ?v13)
             (pred_2 ?v4)
             (pred_12 ?v13)
             (pred_6 ))



(:action op_5
:parameters (?v8 ?v10 ?v11 ?v2)
:precondition (and (pred_10 ?v8) (pred_10 ?v10) (pred_5 ?v11) (pred_3 ?v2)
          (pred_4 ?v8 ?v10) (pred_9 ?v11 ?v2)
                   (pred_1 ?v10 ?v2) (pred_7 ?v8) 
                   (pred_11 ?v10) (pred_2 ?v11))
:effect (and  (pred_12 ?v10) (not (pred_11 ?v10))))


(:action op_3
:parameters (?v8 ?v7)
:precondition (and (pred_10 ?v8) (pred_10 ?v7)
               (pred_7 ?v8) (pred_4 ?v8 ?v7) (pred_12 ?v7))
:effect (and (pred_7 ?v7) (not (pred_7 ?v8))))

(:action op_2
:parameters (?v8 ?v11)
:precondition (and (pred_10 ?v8) (pred_5 ?v11) 
                  (pred_7 ?v8) (pred_8 ?v11 ?v8) (pred_6 ))
:effect (and (pred_2 ?v11)
   (not (pred_8 ?v11 ?v8)) (not (pred_6 ))))


(:action op_4
:parameters (?v8 ?v3 ?v9)
:precondition (and (pred_10 ?v8) (pred_5 ?v3) (pred_5 ?v9)
                  (pred_7 ?v8) (pred_2 ?v9) (pred_8 ?v3 ?v8))
:effect (and (pred_2 ?v3) (pred_8 ?v9 ?v8)
        (not (pred_2 ?v9)) (not (pred_8 ?v3 ?v8))))

(:action op_1
:parameters (?v8 ?v11)
:precondition (and (pred_10 ?v8) (pred_5 ?v11) 
                  (pred_7 ?v8) (pred_2 ?v11))
:effect (and (pred_6 ) (pred_8 ?v11 ?v8) (not (pred_2 ?v11)))))


	
