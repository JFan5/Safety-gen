(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v12 ?v2)
             (pred_10 ?v7 ?v4)
             (pred_5 ?v12 ?v4)
             (pred_7 ?v6 ?v12 )
	     (pred_11 ?v12)
             (pred_8 ?v1)
             (pred_6 ?v7)
             (pred_4 ?v4)
             (pred_3 ?v12)
             (pred_12 ?v7)
             (pred_1 ?v12)
             (pred_2 ))



(:action op_4
:parameters (?v8 ?v13 ?v3 ?v9)
:precondition (and (pred_8 ?v8) (pred_8 ?v13) (pred_6 ?v3) (pred_4 ?v9)
          (pred_9 ?v8 ?v13) (pred_10 ?v3 ?v9)
                   (pred_5 ?v13 ?v9) (pred_11 ?v8) 
                   (pred_3 ?v13) (pred_12 ?v3))
:effect (and  (pred_1 ?v13) (not (pred_3 ?v13))))


(:action op_5
:parameters (?v8 ?v11)
:precondition (and (pred_8 ?v8) (pred_8 ?v11)
               (pred_11 ?v8) (pred_9 ?v8 ?v11) (pred_1 ?v11))
:effect (and (pred_11 ?v11) (not (pred_11 ?v8))))

(:action op_2
:parameters (?v8 ?v3)
:precondition (and (pred_8 ?v8) (pred_6 ?v3) 
                  (pred_11 ?v8) (pred_7 ?v3 ?v8) (pred_2 ))
:effect (and (pred_12 ?v3)
   (not (pred_7 ?v3 ?v8)) (not (pred_2 ))))


(:action op_1
:parameters (?v8 ?v10 ?v5)
:precondition (and (pred_8 ?v8) (pred_6 ?v10) (pred_6 ?v5)
                  (pred_11 ?v8) (pred_12 ?v5) (pred_7 ?v10 ?v8))
:effect (and (pred_12 ?v10) (pred_7 ?v5 ?v8)
        (not (pred_12 ?v5)) (not (pred_7 ?v10 ?v8))))

(:action op_3
:parameters (?v8 ?v3)
:precondition (and (pred_8 ?v8) (pred_6 ?v3) 
                  (pred_11 ?v8) (pred_12 ?v3))
:effect (and (pred_2 ) (pred_7 ?v3 ?v8) (not (pred_12 ?v3)))))


	
