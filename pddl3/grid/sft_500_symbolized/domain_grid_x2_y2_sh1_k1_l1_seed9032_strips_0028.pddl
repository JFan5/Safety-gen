(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v6 ?v13)
             (pred_7 ?v4 ?v5)
             (pred_2 ?v6 ?v5)
             (pred_8 ?v10 ?v6 )
	     (pred_12 ?v6)
             (pred_3 ?v1)
             (pred_11 ?v4)
             (pred_4 ?v5)
             (pred_1 ?v6)
             (pred_5 ?v4)
             (pred_9 ?v6)
             (pred_10 ))



(:action op_1
:parameters (?v12 ?v8 ?v3 ?v2)
:precondition (and (pred_3 ?v12) (pred_3 ?v8) (pred_11 ?v3) (pred_4 ?v2)
          (pred_6 ?v12 ?v8) (pred_7 ?v3 ?v2)
                   (pred_2 ?v8 ?v2) (pred_12 ?v12) 
                   (pred_1 ?v8) (pred_5 ?v3))
:effect (and  (pred_9 ?v8) (not (pred_1 ?v8))))


(:action op_3
:parameters (?v12 ?v11)
:precondition (and (pred_3 ?v12) (pred_3 ?v11)
               (pred_12 ?v12) (pred_6 ?v12 ?v11) (pred_9 ?v11))
:effect (and (pred_12 ?v11) (not (pred_12 ?v12))))

(:action op_4
:parameters (?v12 ?v3)
:precondition (and (pred_3 ?v12) (pred_11 ?v3) 
                  (pred_12 ?v12) (pred_8 ?v3 ?v12) (pred_10 ))
:effect (and (pred_5 ?v3)
   (not (pred_8 ?v3 ?v12)) (not (pred_10 ))))


(:action op_5
:parameters (?v12 ?v7 ?v9)
:precondition (and (pred_3 ?v12) (pred_11 ?v7) (pred_11 ?v9)
                  (pred_12 ?v12) (pred_5 ?v9) (pred_8 ?v7 ?v12))
:effect (and (pred_5 ?v7) (pred_8 ?v9 ?v12)
        (not (pred_5 ?v9)) (not (pred_8 ?v7 ?v12))))

(:action op_2
:parameters (?v12 ?v3)
:precondition (and (pred_3 ?v12) (pred_11 ?v3) 
                  (pred_12 ?v12) (pred_5 ?v3))
:effect (and (pred_10 ) (pred_8 ?v3 ?v12) (not (pred_5 ?v3)))))


	
