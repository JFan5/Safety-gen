(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v2)
             (pred_12 ?v4 ?v6)
             (pred_3 ?v5 ?v6)
             (pred_5 ?v11 ?v5 )
	     (pred_6 ?v5)
             (pred_7 ?v13)
             (pred_1 ?v4)
             (pred_11 ?v6)
             (pred_2 ?v5)
             (pred_10 ?v4)
             (pred_4 ?v5)
             (pred_8 ))



(:action op_2
:parameters (?v12 ?v8 ?v1 ?v7)
:precondition (and (pred_7 ?v12) (pred_7 ?v8) (pred_1 ?v1) (pred_11 ?v7)
          (pred_9 ?v12 ?v8) (pred_12 ?v1 ?v7)
                   (pred_3 ?v8 ?v7) (pred_6 ?v12) 
                   (pred_2 ?v8) (pred_10 ?v1))
:effect (and  (pred_4 ?v8) (not (pred_2 ?v8))))


(:action op_3
:parameters (?v12 ?v3)
:precondition (and (pred_7 ?v12) (pred_7 ?v3)
               (pred_6 ?v12) (pred_9 ?v12 ?v3) (pred_4 ?v3))
:effect (and (pred_6 ?v3) (not (pred_6 ?v12))))

(:action op_4
:parameters (?v12 ?v1)
:precondition (and (pred_7 ?v12) (pred_1 ?v1) 
                  (pred_6 ?v12) (pred_5 ?v1 ?v12) (pred_8 ))
:effect (and (pred_10 ?v1)
   (not (pred_5 ?v1 ?v12)) (not (pred_8 ))))


(:action op_5
:parameters (?v12 ?v10 ?v9)
:precondition (and (pred_7 ?v12) (pred_1 ?v10) (pred_1 ?v9)
                  (pred_6 ?v12) (pred_10 ?v9) (pred_5 ?v10 ?v12))
:effect (and (pred_10 ?v10) (pred_5 ?v9 ?v12)
        (not (pred_10 ?v9)) (not (pred_5 ?v10 ?v12))))

(:action op_1
:parameters (?v12 ?v1)
:precondition (and (pred_7 ?v12) (pred_1 ?v1) 
                  (pred_6 ?v12) (pred_10 ?v1))
:effect (and (pred_8 ) (pred_5 ?v1 ?v12) (not (pred_10 ?v1)))))


	
