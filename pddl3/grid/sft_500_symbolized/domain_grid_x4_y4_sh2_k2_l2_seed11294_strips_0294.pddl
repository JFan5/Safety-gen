(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v3 ?v6)
             (pred_9 ?v10 ?v5)
             (pred_11 ?v3 ?v5)
             (pred_6 ?v9 ?v3 )
	     (pred_8 ?v3)
             (pred_4 ?v13)
             (pred_5 ?v10)
             (pred_3 ?v5)
             (pred_1 ?v3)
             (pred_7 ?v10)
             (pred_2 ?v3)
             (pred_12 ))



(:action op_4
:parameters (?v12 ?v8 ?v1 ?v11)
:precondition (and (pred_4 ?v12) (pred_4 ?v8) (pred_5 ?v1) (pred_3 ?v11)
          (pred_10 ?v12 ?v8) (pred_9 ?v1 ?v11)
                   (pred_11 ?v8 ?v11) (pred_8 ?v12) 
                   (pred_1 ?v8) (pred_7 ?v1))
:effect (and  (pred_2 ?v8) (not (pred_1 ?v8))))


(:action op_2
:parameters (?v12 ?v2)
:precondition (and (pred_4 ?v12) (pred_4 ?v2)
               (pred_8 ?v12) (pred_10 ?v12 ?v2) (pred_2 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v12))))

(:action op_5
:parameters (?v12 ?v1)
:precondition (and (pred_4 ?v12) (pred_5 ?v1) 
                  (pred_8 ?v12) (pred_6 ?v1 ?v12) (pred_12 ))
:effect (and (pred_7 ?v1)
   (not (pred_6 ?v1 ?v12)) (not (pred_12 ))))


(:action op_1
:parameters (?v12 ?v4 ?v7)
:precondition (and (pred_4 ?v12) (pred_5 ?v4) (pred_5 ?v7)
                  (pred_8 ?v12) (pred_7 ?v7) (pred_6 ?v4 ?v12))
:effect (and (pred_7 ?v4) (pred_6 ?v7 ?v12)
        (not (pred_7 ?v7)) (not (pred_6 ?v4 ?v12))))

(:action op_3
:parameters (?v12 ?v1)
:precondition (and (pred_4 ?v12) (pred_5 ?v1) 
                  (pred_8 ?v12) (pred_7 ?v1))
:effect (and (pred_12 ) (pred_6 ?v1 ?v12) (not (pred_7 ?v1)))))


	
