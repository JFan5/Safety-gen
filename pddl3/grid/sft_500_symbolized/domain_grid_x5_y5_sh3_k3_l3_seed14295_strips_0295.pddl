(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v10 ?v7)
             (pred_4 ?v5 ?v8)
             (pred_12 ?v10 ?v8)
             (pred_5 ?v6 ?v10 )
	     (pred_11 ?v10)
             (pred_10 ?v13)
             (pred_8 ?v5)
             (pred_7 ?v8)
             (pred_1 ?v10)
             (pred_6 ?v5)
             (pred_3 ?v10)
             (pred_2 ))



(:action op_5
:parameters (?v12 ?v1 ?v4 ?v9)
:precondition (and (pred_10 ?v12) (pred_10 ?v1) (pred_8 ?v4) (pred_7 ?v9)
          (pred_9 ?v12 ?v1) (pred_4 ?v4 ?v9)
                   (pred_12 ?v1 ?v9) (pred_11 ?v12) 
                   (pred_1 ?v1) (pred_6 ?v4))
:effect (and  (pred_3 ?v1) (not (pred_1 ?v1))))


(:action op_4
:parameters (?v12 ?v2)
:precondition (and (pred_10 ?v12) (pred_10 ?v2)
               (pred_11 ?v12) (pred_9 ?v12 ?v2) (pred_3 ?v2))
:effect (and (pred_11 ?v2) (not (pred_11 ?v12))))

(:action op_1
:parameters (?v12 ?v4)
:precondition (and (pred_10 ?v12) (pred_8 ?v4) 
                  (pred_11 ?v12) (pred_5 ?v4 ?v12) (pred_2 ))
:effect (and (pred_6 ?v4)
   (not (pred_5 ?v4 ?v12)) (not (pred_2 ))))


(:action op_3
:parameters (?v12 ?v11 ?v3)
:precondition (and (pred_10 ?v12) (pred_8 ?v11) (pred_8 ?v3)
                  (pred_11 ?v12) (pred_6 ?v3) (pred_5 ?v11 ?v12))
:effect (and (pred_6 ?v11) (pred_5 ?v3 ?v12)
        (not (pred_6 ?v3)) (not (pred_5 ?v11 ?v12))))

(:action op_2
:parameters (?v12 ?v4)
:precondition (and (pred_10 ?v12) (pred_8 ?v4) 
                  (pred_11 ?v12) (pred_6 ?v4))
:effect (and (pred_2 ) (pred_5 ?v4 ?v12) (not (pred_6 ?v4)))))


	
