(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v7)
             (pred_2 ?v11 ?v13)
             (pred_1 ?v5 ?v13)
             (pred_8 ?v3 ?v5 )
	     (pred_5 ?v5)
             (pred_12 ?v4)
             (pred_10 ?v11)
             (pred_7 ?v13)
             (pred_11 ?v5)
             (pred_9 ?v11)
             (pred_3 ?v5)
             (pred_4 ))



(:action op_4
:parameters (?v12 ?v10 ?v9 ?v6)
:precondition (and (pred_12 ?v12) (pred_12 ?v10) (pred_10 ?v9) (pred_7 ?v6)
          (pred_6 ?v12 ?v10) (pred_2 ?v9 ?v6)
                   (pred_1 ?v10 ?v6) (pred_5 ?v12) 
                   (pred_11 ?v10) (pred_9 ?v9))
:effect (and  (pred_3 ?v10) (not (pred_11 ?v10))))


(:action op_5
:parameters (?v12 ?v1)
:precondition (and (pred_12 ?v12) (pred_12 ?v1)
               (pred_5 ?v12) (pred_6 ?v12 ?v1) (pred_3 ?v1))
:effect (and (pred_5 ?v1) (not (pred_5 ?v12))))

(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_12 ?v12) (pred_10 ?v9) 
                  (pred_5 ?v12) (pred_8 ?v9 ?v12) (pred_4 ))
:effect (and (pred_9 ?v9)
   (not (pred_8 ?v9 ?v12)) (not (pred_4 ))))


(:action op_2
:parameters (?v12 ?v2 ?v8)
:precondition (and (pred_12 ?v12) (pred_10 ?v2) (pred_10 ?v8)
                  (pred_5 ?v12) (pred_9 ?v8) (pred_8 ?v2 ?v12))
:effect (and (pred_9 ?v2) (pred_8 ?v8 ?v12)
        (not (pred_9 ?v8)) (not (pred_8 ?v2 ?v12))))

(:action op_1
:parameters (?v12 ?v9)
:precondition (and (pred_12 ?v12) (pred_10 ?v9) 
                  (pred_5 ?v12) (pred_9 ?v9))
:effect (and (pred_4 ) (pred_8 ?v9 ?v12) (not (pred_9 ?v9)))))


	
