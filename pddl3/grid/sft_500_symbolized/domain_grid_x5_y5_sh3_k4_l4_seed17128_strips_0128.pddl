(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v6 ?v10)
             (pred_9 ?v8 ?v13)
             (pred_5 ?v6 ?v13)
             (pred_12 ?v5 ?v6 )
	     (pred_6 ?v6)
             (pred_2 ?v7)
             (pred_10 ?v8)
             (pred_3 ?v13)
             (pred_7 ?v6)
             (pred_8 ?v8)
             (pred_1 ?v6)
             (pred_4 ))



(:action op_1
:parameters (?v12 ?v1 ?v11 ?v2)
:precondition (and (pred_2 ?v12) (pred_2 ?v1) (pred_10 ?v11) (pred_3 ?v2)
          (pred_11 ?v12 ?v1) (pred_9 ?v11 ?v2)
                   (pred_5 ?v1 ?v2) (pred_6 ?v12) 
                   (pred_7 ?v1) (pred_8 ?v11))
:effect (and  (pred_1 ?v1) (not (pred_7 ?v1))))


(:action op_3
:parameters (?v12 ?v9)
:precondition (and (pred_2 ?v12) (pred_2 ?v9)
               (pred_6 ?v12) (pred_11 ?v12 ?v9) (pred_1 ?v9))
:effect (and (pred_6 ?v9) (not (pred_6 ?v12))))

(:action op_4
:parameters (?v12 ?v11)
:precondition (and (pred_2 ?v12) (pred_10 ?v11) 
                  (pred_6 ?v12) (pred_12 ?v11 ?v12) (pred_4 ))
:effect (and (pred_8 ?v11)
   (not (pred_12 ?v11 ?v12)) (not (pred_4 ))))


(:action op_5
:parameters (?v12 ?v3 ?v4)
:precondition (and (pred_2 ?v12) (pred_10 ?v3) (pred_10 ?v4)
                  (pred_6 ?v12) (pred_8 ?v4) (pred_12 ?v3 ?v12))
:effect (and (pred_8 ?v3) (pred_12 ?v4 ?v12)
        (not (pred_8 ?v4)) (not (pred_12 ?v3 ?v12))))

(:action op_2
:parameters (?v12 ?v11)
:precondition (and (pred_2 ?v12) (pred_10 ?v11) 
                  (pred_6 ?v12) (pred_8 ?v11))
:effect (and (pred_4 ) (pred_12 ?v11 ?v12) (not (pred_8 ?v11)))))


	
