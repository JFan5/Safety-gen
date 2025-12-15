(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v7 ?v11)
             (pred_1 ?v13 ?v1)
             (pred_8 ?v7 ?v1)
             (pred_10 ?v9 ?v7 )
	     (pred_6 ?v7)
             (pred_3 ?v2)
             (pred_12 ?v13)
             (pred_4 ?v1)
             (pred_7 ?v7)
             (pred_11 ?v13)
             (pred_2 ?v7)
             (pred_5 ))



(:action op_1
:parameters (?v5 ?v12 ?v8 ?v3)
:precondition (and (pred_3 ?v5) (pred_3 ?v12) (pred_12 ?v8) (pred_4 ?v3)
          (pred_9 ?v5 ?v12) (pred_1 ?v8 ?v3)
                   (pred_8 ?v12 ?v3) (pred_6 ?v5) 
                   (pred_7 ?v12) (pred_11 ?v8))
:effect (and  (pred_2 ?v12) (not (pred_7 ?v12))))


(:action op_5
:parameters (?v5 ?v4)
:precondition (and (pred_3 ?v5) (pred_3 ?v4)
               (pred_6 ?v5) (pred_9 ?v5 ?v4) (pred_2 ?v4))
:effect (and (pred_6 ?v4) (not (pred_6 ?v5))))

(:action op_4
:parameters (?v5 ?v8)
:precondition (and (pred_3 ?v5) (pred_12 ?v8) 
                  (pred_6 ?v5) (pred_10 ?v8 ?v5) (pred_5 ))
:effect (and (pred_11 ?v8)
   (not (pred_10 ?v8 ?v5)) (not (pred_5 ))))


(:action op_2
:parameters (?v5 ?v10 ?v6)
:precondition (and (pred_3 ?v5) (pred_12 ?v10) (pred_12 ?v6)
                  (pred_6 ?v5) (pred_11 ?v6) (pred_10 ?v10 ?v5))
:effect (and (pred_11 ?v10) (pred_10 ?v6 ?v5)
        (not (pred_11 ?v6)) (not (pred_10 ?v10 ?v5))))

(:action op_3
:parameters (?v5 ?v8)
:precondition (and (pred_3 ?v5) (pred_12 ?v8) 
                  (pred_6 ?v5) (pred_11 ?v8))
:effect (and (pred_5 ) (pred_10 ?v8 ?v5) (not (pred_11 ?v8)))))


	
