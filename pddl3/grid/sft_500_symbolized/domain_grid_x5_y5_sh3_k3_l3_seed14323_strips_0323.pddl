(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v2 ?v10)
             (pred_9 ?v13 ?v7)
             (pred_2 ?v2 ?v7)
             (pred_7 ?v3 ?v2 )
	     (pred_12 ?v2)
             (pred_4 ?v6)
             (pred_10 ?v13)
             (pred_8 ?v7)
             (pred_3 ?v2)
             (pred_1 ?v13)
             (pred_5 ?v2)
             (pred_6 ))



(:action op_4
:parameters (?v12 ?v5 ?v9 ?v8)
:precondition (and (pred_4 ?v12) (pred_4 ?v5) (pred_10 ?v9) (pred_8 ?v8)
          (pred_11 ?v12 ?v5) (pred_9 ?v9 ?v8)
                   (pred_2 ?v5 ?v8) (pred_12 ?v12) 
                   (pred_3 ?v5) (pred_1 ?v9))
:effect (and  (pred_5 ?v5) (not (pred_3 ?v5))))


(:action op_5
:parameters (?v12 ?v1)
:precondition (and (pred_4 ?v12) (pred_4 ?v1)
               (pred_12 ?v12) (pred_11 ?v12 ?v1) (pred_5 ?v1))
:effect (and (pred_12 ?v1) (not (pred_12 ?v12))))

(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_4 ?v12) (pred_10 ?v9) 
                  (pred_12 ?v12) (pred_7 ?v9 ?v12) (pred_6 ))
:effect (and (pred_1 ?v9)
   (not (pred_7 ?v9 ?v12)) (not (pred_6 ))))


(:action op_2
:parameters (?v12 ?v11 ?v4)
:precondition (and (pred_4 ?v12) (pred_10 ?v11) (pred_10 ?v4)
                  (pred_12 ?v12) (pred_1 ?v4) (pred_7 ?v11 ?v12))
:effect (and (pred_1 ?v11) (pred_7 ?v4 ?v12)
        (not (pred_1 ?v4)) (not (pred_7 ?v11 ?v12))))

(:action op_1
:parameters (?v12 ?v9)
:precondition (and (pred_4 ?v12) (pred_10 ?v9) 
                  (pred_12 ?v12) (pred_1 ?v9))
:effect (and (pred_6 ) (pred_7 ?v9 ?v12) (not (pred_1 ?v9)))))


	
