(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v9 ?v3)
             (pred_3 ?v2 ?v7)
             (pred_12 ?v9 ?v7)
             (pred_11 ?v10 ?v9 )
	     (pred_7 ?v9)
             (pred_6 ?v1)
             (pred_1 ?v2)
             (pred_5 ?v7)
             (pred_10 ?v9)
             (pred_2 ?v2)
             (pred_4 ?v9)
             (pred_8 ))



(:action op_5
:parameters (?v12 ?v8 ?v13 ?v11)
:precondition (and (pred_6 ?v12) (pred_6 ?v8) (pred_1 ?v13) (pred_5 ?v11)
          (pred_9 ?v12 ?v8) (pred_3 ?v13 ?v11)
                   (pred_12 ?v8 ?v11) (pred_7 ?v12) 
                   (pred_10 ?v8) (pred_2 ?v13))
:effect (and  (pred_4 ?v8) (not (pred_10 ?v8))))


(:action op_3
:parameters (?v12 ?v5)
:precondition (and (pred_6 ?v12) (pred_6 ?v5)
               (pred_7 ?v12) (pred_9 ?v12 ?v5) (pred_4 ?v5))
:effect (and (pred_7 ?v5) (not (pred_7 ?v12))))

(:action op_1
:parameters (?v12 ?v13)
:precondition (and (pred_6 ?v12) (pred_1 ?v13) 
                  (pred_7 ?v12) (pred_11 ?v13 ?v12) (pred_8 ))
:effect (and (pred_2 ?v13)
   (not (pred_11 ?v13 ?v12)) (not (pred_8 ))))


(:action op_4
:parameters (?v12 ?v4 ?v6)
:precondition (and (pred_6 ?v12) (pred_1 ?v4) (pred_1 ?v6)
                  (pred_7 ?v12) (pred_2 ?v6) (pred_11 ?v4 ?v12))
:effect (and (pred_2 ?v4) (pred_11 ?v6 ?v12)
        (not (pred_2 ?v6)) (not (pred_11 ?v4 ?v12))))

(:action op_2
:parameters (?v12 ?v13)
:precondition (and (pred_6 ?v12) (pred_1 ?v13) 
                  (pred_7 ?v12) (pred_2 ?v13))
:effect (and (pred_8 ) (pred_11 ?v13 ?v12) (not (pred_2 ?v13)))))


	
