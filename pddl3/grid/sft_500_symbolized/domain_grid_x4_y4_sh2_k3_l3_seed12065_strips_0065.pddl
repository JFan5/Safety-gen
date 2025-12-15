(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v4 ?v1)
             (pred_3 ?v5 ?v11)
             (pred_10 ?v4 ?v11)
             (pred_12 ?v9 ?v4 )
	     (pred_5 ?v4)
             (pred_1 ?v7)
             (pred_7 ?v5)
             (pred_4 ?v11)
             (pred_2 ?v4)
             (pred_11 ?v5)
             (pred_6 ?v4)
             (pred_8 ))



(:action op_5
:parameters (?v3 ?v10 ?v12 ?v8)
:precondition (and (pred_1 ?v3) (pred_1 ?v10) (pred_7 ?v12) (pred_4 ?v8)
          (pred_9 ?v3 ?v10) (pred_3 ?v12 ?v8)
                   (pred_10 ?v10 ?v8) (pred_5 ?v3) 
                   (pred_2 ?v10) (pred_11 ?v12))
:effect (and  (pred_6 ?v10) (not (pred_2 ?v10))))


(:action op_3
:parameters (?v3 ?v2)
:precondition (and (pred_1 ?v3) (pred_1 ?v2)
               (pred_5 ?v3) (pred_9 ?v3 ?v2) (pred_6 ?v2))
:effect (and (pred_5 ?v2) (not (pred_5 ?v3))))

(:action op_4
:parameters (?v3 ?v12)
:precondition (and (pred_1 ?v3) (pred_7 ?v12) 
                  (pred_5 ?v3) (pred_12 ?v12 ?v3) (pred_8 ))
:effect (and (pred_11 ?v12)
   (not (pred_12 ?v12 ?v3)) (not (pred_8 ))))


(:action op_1
:parameters (?v3 ?v6 ?v13)
:precondition (and (pred_1 ?v3) (pred_7 ?v6) (pred_7 ?v13)
                  (pred_5 ?v3) (pred_11 ?v13) (pred_12 ?v6 ?v3))
:effect (and (pred_11 ?v6) (pred_12 ?v13 ?v3)
        (not (pred_11 ?v13)) (not (pred_12 ?v6 ?v3))))

(:action op_2
:parameters (?v3 ?v12)
:precondition (and (pred_1 ?v3) (pred_7 ?v12) 
                  (pred_5 ?v3) (pred_11 ?v12))
:effect (and (pred_8 ) (pred_12 ?v12 ?v3) (not (pred_11 ?v12)))))


	
