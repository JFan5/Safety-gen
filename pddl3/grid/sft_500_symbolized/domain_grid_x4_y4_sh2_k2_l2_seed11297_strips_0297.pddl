(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v6 ?v1)
             (pred_5 ?v9 ?v10)
             (pred_7 ?v6 ?v10)
             (pred_6 ?v2 ?v6 )
	     (pred_10 ?v6)
             (pred_11 ?v7)
             (pred_8 ?v9)
             (pred_4 ?v10)
             (pred_3 ?v6)
             (pred_12 ?v9)
             (pred_1 ?v6)
             (pred_2 ))



(:action op_3
:parameters (?v8 ?v11 ?v4 ?v13)
:precondition (and (pred_11 ?v8) (pred_11 ?v11) (pred_8 ?v4) (pred_4 ?v13)
          (pred_9 ?v8 ?v11) (pred_5 ?v4 ?v13)
                   (pred_7 ?v11 ?v13) (pred_10 ?v8) 
                   (pred_3 ?v11) (pred_12 ?v4))
:effect (and  (pred_1 ?v11) (not (pred_3 ?v11))))


(:action op_5
:parameters (?v8 ?v5)
:precondition (and (pred_11 ?v8) (pred_11 ?v5)
               (pred_10 ?v8) (pred_9 ?v8 ?v5) (pred_1 ?v5))
:effect (and (pred_10 ?v5) (not (pred_10 ?v8))))

(:action op_4
:parameters (?v8 ?v4)
:precondition (and (pred_11 ?v8) (pred_8 ?v4) 
                  (pred_10 ?v8) (pred_6 ?v4 ?v8) (pred_2 ))
:effect (and (pred_12 ?v4)
   (not (pred_6 ?v4 ?v8)) (not (pred_2 ))))


(:action op_2
:parameters (?v8 ?v3 ?v12)
:precondition (and (pred_11 ?v8) (pred_8 ?v3) (pred_8 ?v12)
                  (pred_10 ?v8) (pred_12 ?v12) (pred_6 ?v3 ?v8))
:effect (and (pred_12 ?v3) (pred_6 ?v12 ?v8)
        (not (pred_12 ?v12)) (not (pred_6 ?v3 ?v8))))

(:action op_1
:parameters (?v8 ?v4)
:precondition (and (pred_11 ?v8) (pred_8 ?v4) 
                  (pred_10 ?v8) (pred_12 ?v4))
:effect (and (pred_2 ) (pred_6 ?v4 ?v8) (not (pred_12 ?v4)))))


	
