(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v5 ?v7)
             (pred_7 ?v10 ?v6)
             (pred_2 ?v5 ?v6)
             (pred_12 ?v13 ?v5 )
	     (pred_6 ?v5)
             (pred_4 ?v9)
             (pred_3 ?v10)
             (pred_11 ?v6)
             (pred_8 ?v5)
             (pred_5 ?v10)
             (pred_10 ?v5)
             (pred_1 ))



(:action op_5
:parameters (?v3 ?v2 ?v11 ?v1)
:precondition (and (pred_4 ?v3) (pred_4 ?v2) (pred_3 ?v11) (pred_11 ?v1)
          (pred_9 ?v3 ?v2) (pred_7 ?v11 ?v1)
                   (pred_2 ?v2 ?v1) (pred_6 ?v3) 
                   (pred_8 ?v2) (pred_5 ?v11))
:effect (and  (pred_10 ?v2) (not (pred_8 ?v2))))


(:action op_1
:parameters (?v3 ?v12)
:precondition (and (pred_4 ?v3) (pred_4 ?v12)
               (pred_6 ?v3) (pred_9 ?v3 ?v12) (pred_10 ?v12))
:effect (and (pred_6 ?v12) (not (pred_6 ?v3))))

(:action op_3
:parameters (?v3 ?v11)
:precondition (and (pred_4 ?v3) (pred_3 ?v11) 
                  (pred_6 ?v3) (pred_12 ?v11 ?v3) (pred_1 ))
:effect (and (pred_5 ?v11)
   (not (pred_12 ?v11 ?v3)) (not (pred_1 ))))


(:action op_2
:parameters (?v3 ?v8 ?v4)
:precondition (and (pred_4 ?v3) (pred_3 ?v8) (pred_3 ?v4)
                  (pred_6 ?v3) (pred_5 ?v4) (pred_12 ?v8 ?v3))
:effect (and (pred_5 ?v8) (pred_12 ?v4 ?v3)
        (not (pred_5 ?v4)) (not (pred_12 ?v8 ?v3))))

(:action op_4
:parameters (?v3 ?v11)
:precondition (and (pred_4 ?v3) (pred_3 ?v11) 
                  (pred_6 ?v3) (pred_5 ?v11))
:effect (and (pred_1 ) (pred_12 ?v11 ?v3) (not (pred_5 ?v11)))))


	
