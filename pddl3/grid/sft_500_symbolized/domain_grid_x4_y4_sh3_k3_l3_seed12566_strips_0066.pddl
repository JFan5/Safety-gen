(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v2 ?v7)
             (pred_3 ?v5 ?v4)
             (pred_6 ?v2 ?v4)
             (pred_7 ?v13 ?v2 )
	     (pred_9 ?v2)
             (pred_8 ?v3)
             (pred_12 ?v5)
             (pred_5 ?v4)
             (pred_11 ?v2)
             (pred_4 ?v5)
             (pred_2 ?v2)
             (pred_1 ))



(:action op_2
:parameters (?v12 ?v10 ?v11 ?v9)
:precondition (and (pred_8 ?v12) (pred_8 ?v10) (pred_12 ?v11) (pred_5 ?v9)
          (pred_10 ?v12 ?v10) (pred_3 ?v11 ?v9)
                   (pred_6 ?v10 ?v9) (pred_9 ?v12) 
                   (pred_11 ?v10) (pred_4 ?v11))
:effect (and  (pred_2 ?v10) (not (pred_11 ?v10))))


(:action op_1
:parameters (?v12 ?v1)
:precondition (and (pred_8 ?v12) (pred_8 ?v1)
               (pred_9 ?v12) (pred_10 ?v12 ?v1) (pred_2 ?v1))
:effect (and (pred_9 ?v1) (not (pred_9 ?v12))))

(:action op_5
:parameters (?v12 ?v11)
:precondition (and (pred_8 ?v12) (pred_12 ?v11) 
                  (pred_9 ?v12) (pred_7 ?v11 ?v12) (pred_1 ))
:effect (and (pred_4 ?v11)
   (not (pred_7 ?v11 ?v12)) (not (pred_1 ))))


(:action op_4
:parameters (?v12 ?v8 ?v6)
:precondition (and (pred_8 ?v12) (pred_12 ?v8) (pred_12 ?v6)
                  (pred_9 ?v12) (pred_4 ?v6) (pred_7 ?v8 ?v12))
:effect (and (pred_4 ?v8) (pred_7 ?v6 ?v12)
        (not (pred_4 ?v6)) (not (pred_7 ?v8 ?v12))))

(:action op_3
:parameters (?v12 ?v11)
:precondition (and (pred_8 ?v12) (pred_12 ?v11) 
                  (pred_9 ?v12) (pred_4 ?v11))
:effect (and (pred_1 ) (pred_7 ?v11 ?v12) (not (pred_4 ?v11)))))


	
